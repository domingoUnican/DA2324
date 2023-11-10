#lang racket
(define (partitions n)
  (define (p-act n k)
    (cond
      ((and (= n 0) (= k 0)) 1)
      ((and (>= n 0) (>= k 1)) (+ (p-act n (- k 1)) (p-act (- n k) k)))
      (else 0)))
  
  (p-act n n))

(define n 10) ; Puedes cambiar el valor de n aquí
(display "p(")
(display n)
(display ") = ")
(display (partitions n))
(newline)