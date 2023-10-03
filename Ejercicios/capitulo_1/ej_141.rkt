#lang racket

;Ejer 1.41

(define (inc n) (+ n 1))

(define (double f ) (lambda (n) (f (f n))))

(((double (double double)) inc) 5)

;(double double) se podria explicar como un procedimiento duplicado y cuando
;se hace el primer double se hace el (double double) dos veces y por tanto es
;como (2^2)^2

