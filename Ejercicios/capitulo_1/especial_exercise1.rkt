#lang racket
(define (f x) 
   (let ((a (+ x 10))
        (b (* a 5)))
         (+ a b))
)
(f 2)      ; Fails.  Why?

;falla por lo siguiete
;la equivalecia a la función let dentro de un difen es como una función lambda

(define (g x)
  ((lambda (a b) (+ a b)) ; aqui se define lamda se dice que se le pasan dos parametro y que estos dos se sumarán
   (+ x 10); este es el primer parametro que se le pasa a la función lambda la cual se la define con x 
   (* a 5); Este es el segundo parametro, el cual es el que da problema.
   )      ; El motivo de éste, es que se define con el primer parametro de la misma función lambda.
  )
(g 2)