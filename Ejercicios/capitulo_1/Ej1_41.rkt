#lang racket
;Función 'double' que toma una función 'f' y devuelve una función que aplica 'f' dos veces a su entrada.
(define (double f)
  (lambda (x) (f (f x))))

;Función inc que suma 1 a su argumento 'x'.
(define (inc x)
  (+ x 1))

;Prueba del procedimiento.
(display (((double (double double)) inc) 5))
