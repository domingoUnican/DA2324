#lang racket
(define (reverse lista) 
   (if (null? lista) 
       lista
       (append (reverse(cdr lista)) (list (car lista)))))

(define (deep-reverse lista) 
   (if (not (pair? lista)) 
       lista
       (append (deep-reverse(cdr lista)) (list (deep-reverse (car lista))))))

(define x 
  (list (list 1 2) (list 3 4)))

(reverse x)
(deep-reverse x)
