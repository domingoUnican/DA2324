#lang racket
;Función compose que toma dos funciones f y g y devuelve una función f(g(x)).
(define (compose f g)
  (lambda (x) (f (g x))))
;Función square que calcula el cuadrado de su argumento x.
(define (square x)
  (* x x))

;Función repeticion que toma una función f y un número n y devuelve una función que aplica f, n veces.
(define (repeticion f n)
  (if (= n 1)
      f
      (compose f (repeticion f (- n 1)))))

;Prueba del procedimiento.
(display ((repeticion square 2) 5)) 
