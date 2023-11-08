#lang racket
(define (top-down n k)
  (cond
    ((or (= n 0) (= n 1)) 1)
    ((= k 0) 0)
    ((= k 1) 1)
    ((= n 2) 2)
    ((> k n) (top-down n n))
    (else
     (+ (top-down n (- k 1)) (top-down (- n k) k)))))

(top-down 7 4)

