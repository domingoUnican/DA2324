#lang racket

(define (make-even-fail)
  (define even 0)
  (define (invoke v)
    (cond
      ((= even 0) (begin (set! even 1) v))
      (else (begin (set! even 0) 0))))
  invoke)

(define f (make-even-fail))

(+ (f 0) (f 1))
(+ (f 1) (f 0))