#lang racket

(define (make-accumulator n)
  (define (accumulate a)
    (set! n (+ n a))
    n
    )
  accumulate
  )

(define A (make-accumulator 5))
(A 10)
(A 10)

(define B (make-accumulator 7))
(B 10)
(B 11)