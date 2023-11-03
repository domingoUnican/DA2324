#lang racket
(define (p n k)
  (cond ((or (= n 0) (= k 0)) 1)
        ((and (>= n 0) (>= k 1))
         (cond ((= k 1) 1)
               ((> k n) (p n n))
               (else (+ (p n (- k 1)) (p (- n k) k))))+
         )
        (else 0)))



; ejemplos
(p 5 2)
(p 8 5)
(p 2 8)
(p 7 4)