#lang racket

(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)
;Es equivalente a (2 * 2 * 2* 2) + 5 = 21