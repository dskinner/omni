(default-duplicate-binding-handler '(replace last))
(use-modules (srfi srfi-64)
             (nui)
             (nui gestures)
             (fibers))

(define-syntax-rule (benchmark e ...)
  (let ((now (tms:clock (times))))
    (begin e ...)
    (format #t "~,2fs ~a\n" (/ (- (tms:clock (times)) now) 1e9) (quote e ...))))

(test-begin "test gestures")

(define (%bench)
  'TODO)

(define (bench args)
  (format #t "%%%% Starting benchmarks ~a\n" args)
  (run-fibers %bench #:drain? #t))
