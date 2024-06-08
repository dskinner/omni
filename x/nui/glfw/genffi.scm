#!/bin/sh
# -*- Scheme -*-
exec guile "$0"
!#

(use-modules (ice-9 rdelim)
             (ice-9 regex))

(define (hyphenate s)
  (regexp-substitute/global #f "[A-Z]" s
                            'pre "-" (λ (m) (string-downcase (match:substring m))) 'post))

(define* (map-type t #:key (checkvoid? #t))
  (cond
   ((and checkvoid? (equal? "void" t)) "'()")
   ((string-match "(u?int[0-64]{1,2})_t" t) => (λ (m) (match:substring m 1)))
   ((or (string-contains t "*")
        (string-suffix? "fun" t)
        (string-match "GLFW(gl|vk)proc" t))
    "'*")
   ;; TODO vulkan
   ((string-match "(Vk\\w+)" t) "'*")
   (else t)))

(define (join-types ts)
  (cond
   ((= 0 (length ts)) "'()")
   (else (format #f "(list ~a)" (string-join ts " ")))))

(define (split-args s)
  (if (equal? s "void") '()
      (map
       (λ (e)
         (let ((i (string-index-right e #\space)))
           (cons
            (map-type (string-take e i))
            (string-take-right e (- (string-length e) i 1)))))
       (map string-trim (string-split s #\,)))))

(define (parse-api m)
  (let* ((return-type (match:substring m 1))
        (name (match:substring m 2))
        (args (match:substring m 3))
        (arg-names (map cdr (split-args args)))
        (arg-types (map car (split-args args))))
    (format #t "(define-public ~a (foreign-library-function \"libglfw\" \"~a\" #:arg-types ~a #:return-type ~a))\n" name name (join-types arg-types) (map-type return-type #:checkvoid? #f))))

(define (parse-def m)
  (define (replace-all v pairs)
    (if (null? pairs) v
        (replace-all (regexp-substitute/global #f (caar pairs) v 'pre (cdar pairs) 'post) (cdr pairs))))
  
  (define (parse-value-exp v)
    (cond
     ((string-prefix? "0x" (string-trim v))
      (replace-all v (list (cons "0x" "#x"))))
     ((string-contains v "|")
      (replace-all v (list (cons "[ ]+\\|[ ]+" " ") (cons "\\(" "(logior "))))
     (else v)))
  
  (let ((name (string-trim-both (match:substring m 1)))
        (value (parse-value-exp (string-trim-right (match:substring m 2)))))
    (format #t "(define-public ~a ~a)\n" name value)))

(define (lexp line)
  (cond
   ((string-match "^GLFWAPI (.+) (glfw.+)\\((.+)\\);" line) => parse-api)
   ((string-match "^#define (GLFW_\\w+)([0-9a-zA-Z()|_ +-]+)" line) => parse-def)))

(define (locate path)
  (let lp ((paths (string-split (getenv "C_INCLUDE_PATH") #\:)))
    (if (null? paths) (error "unable to locate" path "in $C_INCLUDE_PATH"))
    (let ((f (string-append (car paths) "/" path)))
      (if (file-exists? f) f (lp (cdr paths))))))

(define glfw3.h (open-input-file (locate "GLFW/glfw3.h")))

(display "(define-module (glfw ffi))\n\n(use-modules (system foreign) (system foreign-library))\n\n")
(let reader ((line (read-line glfw3.h)))
  (unless (eof-object? line)
    (lexp line)
    (reader (read-line glfw3.h))))

(close-port glfw3.h)
