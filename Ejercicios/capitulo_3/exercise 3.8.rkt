#lang racket

(define temp 0)
(define (f x)
  (cond ((= x 0) (- temp 1))
        ((= x 1) (set! temp 1) temp)
        ))

(+ (f 0) (f 1))
(+ (f 1) (f 0))