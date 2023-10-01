#lang racket
(cons 1 (cons 2 (cons 3 null))) ; lista
(list 1 2 3) ; lista con funcion

(cons 1 (cons 2 3)) ; no es exactamente una lista

(define (longitud l)
  (if (null? l)
      0
      (+ 1 (longitud (cdr l)))))
(define (concatenar lista1 lista2)
  (if (null? lista1)
      lista2
      (cons (car lista1) (concatenar (cdr lista1) lista2))))

(define x 2)
(define y x)
(define (espar x)
  (if (= (remainder x 2) 0)
      #t
      #f))

(cond (((if (= x 1)
     even?
     odd?) 2) 1)

      (else 2))



     