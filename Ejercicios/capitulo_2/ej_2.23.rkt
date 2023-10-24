#lang racket
(define (for-each p list)
  (define (h lista)
    (p (car lista))
    (if (null? (cdr lista))
        null
        (for-each p (cdr lista))))
  (if (null? list)
      null
      (h list)))

(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))

