#lang racket

;Rescursivo
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))


(define (next x)
  (+ x 1))

(sum (lambda (n) (* n n)) 1 next 5); 1^2 + 2^2 +  3^2 + 4^2 + 5^2 = 55
(product (lambda (n) n) 1 next 5); 1 * 2 * 3 * 4 * 5 = 120