#lang scheme

; Funcion incremento 1
(define (inc x)
  (+ x 1))

; Funcion Doble
(define (double proc)
  (lambda (n) (proc (proc n))))

; Result
(print (((double (double double)) inc) 5))