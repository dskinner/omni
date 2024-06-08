(define-module (nui))

(export nui-run
        nui-spawn
        make-events
        make-drawer
        signal-drawer!
        <paint-event> paint-event paint-event?
        <key-event> key-event key-event?
        <window-size-event> window-size-event window-size-event?)

(import (system foreign)
        (system foreign-library)
        (ice-9 atomic)
        (ice-9 match)
        (ice-9 threads)
        (srfi srfi-9)
        (fibers)
        (fibers channels)
        (fibers conditions)
        (fibers operations)
        (fibers scheduler)
        (fibers timers)
        (glfw ffi)
        (nui events))

;; TODO various code uses r6rs (rnrs bytevectors) but guile has r7rs (scheme base)

(define %libgl "libGLESv2")
(define glClear (foreign-library-function %libgl "glClear" #:arg-types (list int)))
(define glClearColor (foreign-library-function %libgl "glClearColor" #:arg-types (list float float float float)))

(define-syntax-rule (<- ch fn)
  (wrap-operation (get-operation ch) fn))

(define-syntax-rule (<> sig fn)
  (wrap-operation (wait-operation sig) fn))

(define-syntax-rule (select ops ...)
  (perform-operation (choice-operation ops ...)))

(define sched (make-scheduler #:parallelism (current-processor-count)))
(define (%spawn thunk) (spawn-fiber thunk sched #:parallel? #t))
(define nui-spawn %spawn)

(define (make-events)
  ;; infinitely buffered channel; what could go wrong.
  (let ((in (make-channel))
        (out (make-channel))
        (buf '()) ;; TODO probably want a proper vector buffer for speed ...
        (dummy (make-condition))) 
    
    (%spawn
     (λ ()
       (while #t
         (perform-operation
          (choice-operation
           ;; NOTE append! on '() does not work since (cdr '()) is not valid
           (wrap-operation (get-operation in) (λ (ev) (set! buf (append! buf (list ev)))))
           (if (null? buf)
               (wait-operation dummy) ;; TODO something nicer, like if choice-operation ignored #f
               (wrap-operation (put-operation out (car buf)) (λ () (set! buf (cdr buf))))))))))
    
    (case-lambda
      (()
       (get-message out))
      ((ev)
       (put-message in ev)))))

(define %events '())

(define-record-type <paint-event>
  (paint-event)
  paint-event?)

(define-record-type <window-size-event>
  (window-size-event width height)
  window-size-event?
  (width window-size-event-width)
  (height window-size-event-height))
(define (window-size-callback window width height)
  (%events (window-size-event width height)))
(define window-size-callback* (procedure->pointer void window-size-callback (list '* int int)))

(define-record-type <framebuffer-size-event>
  (framebuffer-size-event width height)
  framebuffer-size-event?
  (width framebuffer-size-event-width)
  (height framebuffer-size-event-height))
(define (framebuffer-size-callback window width height)
  (%events (framebuffer-size-event width height)))
(define framebuffer-size-callback* (procedure->pointer void framebuffer-size-callback (list '* int int)))

(define-record-type <key-event>
  (key-event key scancode action mods)
  key-event?
  (key key-event-key)
  (scancode key-event-scancode)
  (action key-event-action)
  (mods key-event-mods))
(define (key-callback window key scancode action mods)
  (%events (key-event key scancode action mods)))
(define key-callback* (procedure->pointer void key-callback (list '* int int int int)))

(define type-invalid #b0000)
(define type-begin   #b0001)
(define type-move    #b0010)
(define type-end     #b0100)
(define type-final   #b1000)

(define current-cursor-xpos 0)
(define current-cursor-ypos 0)
(define current-mouse-buttons 0)
(define current-mouse-mods 0)

(define (cursor-pos-callback window xpos ypos)
  (set! current-cursor-xpos xpos)
  (set! current-cursor-ypos ypos)
  (%events (mouse-event current-mouse-buttons type-move current-mouse-mods xpos ypos))
  )
(define cursor-pos-callback* (procedure->pointer void cursor-pos-callback (list '* double double)))

(define (mouse-button-callback window button action mods)
  (set! current-mouse-mods mods)
  (set! current-mouse-buttons
        ((if (zero? action) logxor logior) current-mouse-buttons (ash 1 button)))

  (%events (mouse-event (ash 1 button)
                        (if (zero? action) type-end type-begin)
                        mods
                        current-cursor-xpos
                        current-cursor-ypos))
  )
(define mouse-button-callback* (procedure->pointer void mouse-button-callback (list '* int int int)))

(define-record-type <scroll-event>
  (scroll-event xoffset yoffset)
  scroll-event?
  (xoffset scroll-event-xoffset)
  (yoffset scroll-event-yoffset))
(define (scroll-callback window xoffset yoffset)
  (%events (scroll-event xoffset yoffset)))
(define scroll-callback* (procedure->pointer void scroll-callback (list '* double double)))

;; box thunk with atomic to encapsulate signal-dirty! instead of top-level define of dirty for drawing
;; e.g. https://github.com/wingo/fibers/blob/master/fibers/conditions.scm
(define-record-type <drawer>
  (%make-drawer thunk sig)
  drawer?
  (thunk drawer-thunk)
  (sig drawer-sig))

(define (make-drawer thunk)
  (%make-drawer thunk (make-atomic-box #t)))

(define (signal-drawer! drawer)
  (atomic-box-set! (drawer-sig drawer) #t))

(define (loop-main drawer)
  (glfwWindowHint GLFW_CLIENT_API GLFW_OPENGL_ES_API)
  (glfwWindowHint GLFW_CONTEXT_VERSION_MAJOR 2)
  (glfwWindowHint GLFW_CONTEXT_VERSION_MINOR 0)
  (glfwWindowHint GLFW_OPENGL_PROFILE GLFW_OPENGL_ANY_PROFILE)
  
  (define window (glfwCreateWindow 640 480 (string->pointer "Hello World") %null-pointer %null-pointer))
  (glfwMakeContextCurrent window)
  
  (glfwSetWindowSizeCallback window window-size-callback*)
  (glfwSetFramebufferSizeCallback window framebuffer-size-callback*)
  (glfwSetKeyCallback window key-callback*)
  (glfwSetCursorPosCallback window cursor-pos-callback*)
  (glfwSetMouseButtonCallback window mouse-button-callback*)
  (glfwSetScrollCallback window scroll-callback*)

  (call-with-new-thread (λ () (run-scheduler sched (λ () #f))))
  (while (= GLFW_FALSE (glfwWindowShouldClose window))
    ;; (gc) ;; NOTE uncomment to find issues with stuff getting gc'd
    (when (atomic-box-compare-and-swap! (drawer-sig drawer) #t #f)
      ((drawer-thunk drawer)))
    
    (glfwSwapBuffers window)
    (glfwPollEvents)))

(define (nui-run events drawer)
  (unless (drawer? drawer)
    (error "incorrect type drawer"))
  (set! %events events)
  (dynamic-wind
    (λ () (unless (= GLFW_TRUE (glfwInit)) (error "glfwInit failed")))
    (λ () (loop-main drawer))
    glfwTerminate))
