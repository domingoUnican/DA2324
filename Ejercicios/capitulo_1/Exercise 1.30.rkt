#lang racket
(define (sum_iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (next x)
  (+ x 1))

(define (cuadrado x)
  (* x x))

(sum_iter cuadrado 1 next 5)
; = 1^2 + 2^2 + 3^2 + 4^2 + 5^2 = 55