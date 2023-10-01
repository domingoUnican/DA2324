#lang racket
(define (reverse lista) 
   (if (null? lista) 
       lista
       (append (reverse(cdr lista)) (list (car lista)))))

 (reverse '(1 4 9 16 25))
