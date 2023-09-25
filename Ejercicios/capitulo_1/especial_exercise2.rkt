#lang racket

(define x 5)
(+ (let ((x 3))
        (+ x (* x 10)))
   x)

; = 38
;dado que

(define y 5)
(+ ((lambda (y) (+ y (* y 10))) 3);Esta b es 3 y se define en la función lambda y dentro la operacion da 33
   y);Esta b es 5 ya que se define en la funcion define y sumando a la función lambda 33 + 5 es 38