#lang racket
;Función compose que toma dos funciones f y g y devuelve una función f(g(x)).
(define (compose f g)
  (lambda (x) (f (g x))))

;Función inc que suma 1 a su argumento x.
(define (inc x)
  (+ x 1))

;Función square que calcula el cuadrado de su argumento x.
(define (square x)
  (* x x))
  
;Prueba del procedimiento.
(display ((compose square inc) 6))
