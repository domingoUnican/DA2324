#lang racket
(define (suma-numeros a b)
  (if (> a b)
      0
      (+ a (suma-numeros (+ a 1) b))))
(define (suma-cuadrados a b)
  (if (> a b)
      0
      (+ (* a a) (suma-cuadrados (+ a 1) b))))
(define (producto-numeros a b)
  (if (> a b)
      1
      (* a (producto-numeros (+ a 1) b))))

(define (acumulador funcion a b)
  (if (> a b)
      0
      (+ (funcion a) (acumulador funcion (+ a 1) b))))
; Funcion que calcula suma-enteros
(acumulador (lambda (n) n) 1 5)
; Funcion que suma los cuadrados
(acumulador (lambda (n) (* n n) ) 0 3)

(define (potencia_cuarta x)
  (define (cuadrado  y)
    (* x y)
    )
  (cuadrado (cuadrado x)))
