#lang racket

;Exercise 1.30

#|(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

|#

;(sum (lambda (n) (* n n)) 1 (lambda (n) (+ n 1)) 3)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

;(sum (lambda (n) (* n n)) 1 (lambda (n) (+ n 1)) 3) -> 14