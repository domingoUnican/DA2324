#lang racket
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result 
        (iter (next a) (* result (term a))))) 
  (iter a 1))

(define result1 (product (lambda (n) n) 1 (lambda (n) (+ n 1)) 10)); Calculamos la suma de los cuadrados

(display result2) ; Mostramos el resultado factorial

(define result2(/ (product (lambda (n) (* n n)) 2 (lambda (n) (+ n 2)) 10) (product (lambda (n) (* n n)) 3 (lambda (n) (+ n 2)) 10)))

(display result2) ; Mostramos el resultado aproximar pi/4
