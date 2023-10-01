#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result 
        (iter (next a) (+ result (term a))))) 
    (iter a 0)) 


(define result (sum (lambda (n) (* n n)) 1 (lambda (n) (+ n 1)) 3)); Calculamos la suma de los cuadrados

(display result) ; Mostramos el resultado
