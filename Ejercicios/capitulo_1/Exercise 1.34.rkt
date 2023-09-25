#lang racket

(define (square x)
  (* x x))

(define (f g) (g 2))

(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

(f f)
; falla dado que segunda f se combierte en un 2 en el define
; entonces ahora f es 2 y no una función 