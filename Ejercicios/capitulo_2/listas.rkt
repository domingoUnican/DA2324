#lang scheme

; Longitud
(define (longitud l)
  (if (null? l)
      0
      (+ 1 (longitud (cdr l)))))

; Concatenar
(define (concatenar lista1 lista2)
  (if (null? lista1)
      lista2
      (cons (car lista1) (concatenar (cdr lista1) lista2))))