(default-duplicate-binding-handler '(replace last))
(import (system foreign)
        (system foreign-library)
        (ice-9 match)
        (fibers)
        (fibers timers)
        (nui)
        (nui gestures))


(define %libgl "libGLESv2")
(define glClear (foreign-library-function %libgl "glClear" #:arg-types (list int)))
(define glClearColor (foreign-library-function %libgl "glClearColor" #:arg-types (list float float float float)))

(define (draw)
  (glClearColor 1.0 0.0 0.0 1.0)
  (glClear 16384))
(define drawer (make-drawer draw))

(define events (make-events))
(define (loop-events)
  (define gef (event-filter (λ (e) (events e))))
  (display "draining events!\n")
  (define i 0)
  (while #t

    (let ((e (gef (events))))
      ;; (display (format #f "~a\n" e))
      ;; (gef e)
      (cond
       ((gesture-event? e)
        (set! i (1+ i))
        (display (format #f "~a ~a\n" i e))))
      )
    
    
    ;; (match (events)
    ;;   (($ <key-event> key _ action mods)
    ;;    (display (format #f "[key=~a][action=~a][mods=~a]\n" key action mods)))
    ;;   ;; ((? key-event? ev)
    ;;   ;;  (display (format #f "~a\n" ev)))
    ;;   ((? window-size-event?)
    ;;    (events (paint-event)))
    ;;   ((? paint-event?)
    ;;    (signal-drawer! drawer))
    ;;   (else #f))

    ))

(define (loop-gc-stats)
  (while #t
    (display (gc-stats))
    (newline)
    (sleep 10)))

(define (main args)
  ;; (nui-spawn loop-gc-stats)
  (nui-spawn loop-events)
  (nui-run events drawer))
