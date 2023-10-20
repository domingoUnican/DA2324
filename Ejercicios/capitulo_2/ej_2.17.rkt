#lang racket
(define (last-pair lista)
  (if (null? (cdr lista))
      lista
      (last-pair (cdr lista))))

(last-pair (list 23 72 149 34))