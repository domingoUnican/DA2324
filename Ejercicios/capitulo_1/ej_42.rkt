#lang scheme

; Increment 1
(define (inc x)
  (+ x 1))

; Square
(define (square x)
  (* x x))

; Composition
(define (compose f g)
  (lambda (n) (f (g n))))

; Result
(print ((compose square inc) 6))