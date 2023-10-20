#lang racket

(define (equal? list1 list2)
  (cond
    ((and (null? list1) (null? list2)) #t)     ;Primero comprabamos si ambas listas son vacias, entonces si son iguales
    ((or (null? list1) (null? list2)) #f)      ;Despues si solo una de las listas no es igual, entonces no son iguales.
    ((not (eq? (car list1) (car list2))) #f)   ;Si las cabezas de las listas no son igaules, entonces retornamos false.
    (else (equal? (cdr list1) (cdr list2)))))  ; Por último, llamamos de forma recursiva al metodo para el resto de la lista.

(equal? '(this is a list) 
        '(this (is a) list))
(equal? '(this is a list) 
        '(this is a list))