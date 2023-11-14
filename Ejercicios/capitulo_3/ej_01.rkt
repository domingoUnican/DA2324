#lang racket

; Accumulator
(define (make-accumulator n)
  (define (dispacht a)
    (set! n (+ n a))
    n)
  dispacht)


(define A (make-accumulator 5))

(A 10)
;15

(A 10)
;25