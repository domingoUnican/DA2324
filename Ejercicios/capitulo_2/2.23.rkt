#lang racket
(define (for-each proc lista)
  (if (null? lista)
      '()
      (begin (proc (car lista)) (for-each proc (cdr lista)))))



(for-each 
 (lambda (x) (begin (newline) (display x)))
 (list 57 321 88))