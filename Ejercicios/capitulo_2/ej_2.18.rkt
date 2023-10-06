#lang racket
(define (concatenar lista1 lista2)
  (if (null? lista1)
      lista2
      (cons (car lista1) (concatenar (cdr lista1) lista2))))

(define (reverse lista)
  (if (null? lista)
      lista
      (concatenar (reverse (cdr lista)) (cons (car lista) null))))

(reverse (list 1 4 9 16 25))