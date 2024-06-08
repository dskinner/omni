(default-duplicate-binding-handler '(replace last))
(add-to-load-path "../")

(define-module (nui gestures))

(export event-filter
        gesture-event?)

(import (srfi srfi-9 gnu)
        (srfi srfi-19)
        (ice-9 control)
        (fibers)
        (nui)
        (nui events))

(define type-invalid #b0000)
(define type-begin   #b0001)
(define type-move    #b0010)
(define type-end     #b0100)
(define type-final   #b1000)

(define (has t x) (= x (logand t x)))
(define (any t x) (not (= 0 (logand t x))))
(define (condition b a) (logior (ash b 4) a))
(define (conditions c) (values (ash c -4) (logand c #xf)))

(define (pt t) (display (number->string t 2)) (newline))

(define touch-margin 20)
(define duration-factor 2) ;; 2 works better for mins, consider leaving max alone, maybe doubleTouchMin alone
(define long-press-min (* duration-factor 0.100))
(define long-press-max (* duration-factor 0.500))
(define double-touch-min (* duration-factor 0.040)) ;; between first up and second down
(define double-touch-max (* duration-factor 0.300)) ;; after second up

;; event type
(define-immutable-record-type <event>
  (event x y type time)
  event?
  (x event-x)
  (y event-y)
  (type event-type set-event-type)
  (time event-time set-event-time))
(define (event-final? ev) (has (event-type ev) type-final))
(define zero-event (event 0 0 0 0))

(define-immutable-record-type <timeout-event>
  (timeout-event value)
  timeout-event?
  (value timeout-event-value))

(define-immutable-record-type <gesture-event>
  (gesture-event kind data)
  gesture-event?
  (kind gesture-event-kind)
  (data gesture-event-data set-gesture-event-data))

(define (last-gesture-event e)
  (last-event (gesture-event-data e)))

(define (last-gesture-event-type e)
  (event-type (last-event (gesture-event-data e))))

(define (condense-gesture-event ge)
  (set-gesture-event-data ge (condense (gesture-event-data ge))))

(define-syntax-rule (define-gesture name pred)
  (begin
    (define (name data) (gesture-event (quote name) data))
    (define (pred e) (and (gesture-event? e) (equal? (quote name) (gesture-event-kind e))))
    (export pred)))

;; TODO move handler λ to define-gesture macro and auto register to delete hand coded gesture-event-handler
(define-gesture touch-event touch-event?)
(define-gesture drag-event drag-event?)
(define-gesture long-press-event long-press-event?)
(define-gesture long-press-drag-event long-press-drag-event?)
(define-gesture double-touch-event double-touch-event?)
(define-gesture double-touch-drag-event double-touch-drag-event?)

(define (gesture-event-handler ev)
  (cond
   ((touch-event? ev) handle-touch-event)
   ((drag-event? ev) handle-drag-event)
   ((long-press-event? ev) handle-long-press-event)
   ((long-press-drag-event? ev) handle-long-press-drag-event)
   ((double-touch-event? ev) handle-double-touch-event)
   ((double-touch-drag-event? ev) handle-double-touch-drag-event)
   (else (error "unknown type for event-handler:" ev))))

;; define conditions
(define touch-condition (condition type-begin 0))
(define dual-touch-condition (condition 0 0))
;; conditions for promoting Touch; assumes type-move events within touch-margin are discarded.
(define long-press-condition (condition type-begin type-begin))
(define drag-condition (condition type-move type-begin))
(define double-touch-condition (condition type-begin type-end))
;;
;; (define end-cond (cond type-end type-begin))
;; (define final-cond (cond type-end type-end))
(define final-condition (condition type-end (logior type-begin type-end)))

;; TODO probably want to use vectors instead of lists below since common to access last two elements
;;      ... or store it in reverse order and switch the appends ???

(define (condense l)
  (if (<= (length l) 3)
      l
      (list (list-ref l 0) (list-ref l (- (length l) 2)) (list-ref l (- (length l) 1)))))

(define (last-event l)
  (if (null? l)
      zero-event
      (list-ref l (- (length l) 1))))

(define (final? l)
  (and (positive? (length l)) (has (event-type (last-event l)) type-final)))

(define (finalize l)
  (let ((i (- (length l) 1)))
    (list-set! l i (set-event-type (list-ref l i) type-final))
    l))

(define (tdiff t1 t2)
  (let ((dur (time-difference t1 t2)))
    (+ (time-second dur) (/ (time-nanosecond dur) 1000000000))))

(define (event-eps>? e1 e2 eps)
  (or (> (abs (- (event-x e1) (event-x e2))) eps)
      (> (abs (- (event-y e1) (event-y e2))) eps)))

(define (handle-touch-event a e)
  (let ((dt (tdiff (event-time e) (event-time (car a))))
        (cn (condition (event-type e) (event-type (last-event a)))))
    (cond
     ((and (has long-press-condition cn)
           (<= long-press-min dt long-press-max))
      (long-press-event a))
     ((and (has drag-condition cn)
           (event-eps>? (car a) e touch-margin))
      (drag-event (append a (list e))))
     ((and (has double-touch-condition cn)
           (<= double-touch-min dt double-touch-max))
      (double-touch-event (append a (list e))))
     ((has final-condition cn)
      (cond
       ((<= dt long-press-min)
        (touch-event (append a (list e))))
       ((= 1 (length a))
        (touch-event (append a (list (set-event-type e type-final)))))
       (else (touch-event (finalize a)))))
     (else (touch-event a)))))

(define (handle-long-press-event a e)
  (cond
   ((= type-begin (event-type e))
    (long-press-drag-event (append a (list e))))
   ((and (= type-move (event-type e))
         (or (> (abs (- (event-x (last-event a)) (event-x e))) touch-margin)
             (> (abs (- (event-y (last-event a)) (event-y e))) touch-margin)))
    (long-press-drag-event (append a (list e))))
   ((= type-end (event-type e))
    (long-press-event (append a (list (set-event-type e type-final)))))
   (else (long-press-event a)))) ;; or nil ???

(define (handle-drag-event a e)
  (when (has (event-type e) type-end)
    (set! e (set-event-type e type-final)))
  (when (any (event-type e) (logior type-move type-final))
    (drag-event (append a (list e)))))

(define (handle-long-press-drag-event a e)
  (when (has (event-type e) type-end)
    (set! e (set-event-type e type-final)))
  (cond
   ((any (event-type e) (logior type-move type-final))
    (long-press-drag-event (append a (list e))))
   ;; (else (long-press-drag-event a))
   ))

(define (handle-double-touch-event a e)
  (let ((dt (tdiff (event-time e) (event-time (last-event a)))))
    (cond
     ((and (= type-move (event-type e))
           (or (> dt long-press-min)
               (event-eps>? (last-event a) e touch-margin)))
      (double-touch-drag-event (append a (list e))))
     ((and (= type-end (event-type e))
           (<= dt long-press-min))
      (double-touch-event (append a (list (set-event-type e type-final)))))
     (else (double-touch-event a)))
    ))

(define (handle-double-touch-drag-event a e)
  (when (= (event-type e) type-end)
    (set! e (set-event-type e type-final)))
  (if (any (event-type e) (logior type-move type-end type-final))
    (double-touch-drag-event (append a (list e)))
    (double-touch-drag-event a)))


(define (event-filter emit)
  (define (emit-after dur e)
    (nui-spawn (λ () (sleep dur) (emit e))))
  (define tracking (list))
  (define last zero-event)
  (λ (e)
    (define ev zero-event)
    (let/ec return
      (cond
       ((mouse-event? e)
        (set! ev (event
                  (mouse-event-xpos e)
                  (mouse-event-ypos e)
                  (mouse-event-action e)
                  (current-time))))
       ((timeout-event? e)
        (when (null? tracking)
          (return e))
        (when (and (touch-event? tracking)
                   (equal? (last-gesture-event-type tracking) (event-type (timeout-event-value e))))
          (set! ev (set-event-time (timeout-event-value e) (current-time))))))

      (when (equal? zero-event ev)
        (return e))

      (when (null? tracking)
        (when (= type-begin (event-type ev))
          (set! tracking (touch-event (list ev)))
          (emit-after long-press-min (timeout-event ev)))
        (emit tracking)
        (return e))

      (set! tracking ((gesture-event-handler tracking) (gesture-event-data tracking) ev))
      (unless (gesture-event? tracking)
        (error "tracking of wrong type:" tracking))

      (when (null? tracking)
        (return e)) ;; gesture was cancelled

      (when (final? (gesture-event-data tracking))
        (emit (condense-gesture-event tracking))
        (set! tracking (list))
        (return e))

      (when (and (touch-event? tracking)
                 (equal? (last-gesture-event-type tracking) type-end))
        (emit-after double-touch-min (timeout-event ev)))

      (when (not (equal? last (last-gesture-event tracking)))
        (emit (condense-gesture-event tracking))
        (set! last (last-gesture-event tracking)))

      (return e))))
