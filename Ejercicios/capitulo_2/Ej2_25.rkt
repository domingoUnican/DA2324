#lang racket
;primero creamos las listas
(define lista1 (list 1 3 (list 5 7) 9))
(define lista2 (list (list 7)))
(define lista3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))


;llegamos a cada 7
(car (cdr (car (cdr (cdr lista1)))));accede al segundo elemento de la lista (5 7)
(car (car lista2));en este tenemos una lista anidada con otra lista que solo contiene un 7.
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr lista3)))))))))))); en este tenemos que llegar al ultimo elemento de la ultima lista anidada.
