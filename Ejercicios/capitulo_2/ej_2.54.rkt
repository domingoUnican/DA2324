#lang racket
(define (equal? lista1 lista2)
  (if (eq? (car lista1) (car lista2))
       (if (null? (cdr lista1))
           (null? (cdr lista2))
           (equal? (cdr lista1) (cdr lista2)))
       false))

(equal? '(this is a list) 
        '(this is a list))

(equal? '(this is a list) 
        '(this (is a) list))