#lang racket
(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(define (cdr z) 
  (z (lambda (p q) q)))

;sustituimos e insertamos el valor de la funcion car
((lambda (resultado) (resultado 1 2)) (lambda (p q) p))
(cdr (cons 1 2))

