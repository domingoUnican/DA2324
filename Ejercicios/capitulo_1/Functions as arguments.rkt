#lang scheme

; Summation in range [a, b]
(define (suma-numeros a b)
  (if (> a b)
      0
      (+ a (suma-numeros (+ a 1) b))))

; Summation of squares in range [a, b]
(define (suma-cuadrados a b)
  (if (> a b)
      0
      (+ (* a a) (suma-numeros (+ a 1) b))))

; Acummulative function
(define (acumulador funcion a b)
  (if (> a b)
      0
      (+ (funcion a) (acumulador funcion (+ a 1) b))))

; Test for different functions
(acumulador (lambda (n) n ) 1 5)
(acumulador (lambda (n) (* n n)) 0 2)
