#lang racket
;ejercicio 2.18

(define (reverse lista)
  (rec lista '()))

(define (rec lista resultado)
  (if (null? lista)
      resultado ;si lista vacia significa que hemos terminado
      (rec (cdr lista) (cons (car lista) resultado)))) 

(display (reverse (list 13 22 48 2)))

