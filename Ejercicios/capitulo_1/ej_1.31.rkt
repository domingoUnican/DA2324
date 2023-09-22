#lang racket

;Exercise 1.31:

;Product Recursivo
(define (product term a next b)
   (if (> a b)
      1
       (* (term a)
          (product term (next a) next b))))


;Product iterativo
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

;Factorial a partir de Product recursivo 
(define (factorial_rec x)
  (product (lambda (n) n) 1 (lambda (n) (+ n 1)) x))

;Factorial a partir de Product iterativo
(define (factorial_iter x)
  (product-iter (lambda (n) n) 1 (lambda (n) (+ n 1)) x))

;Pi con Product recursivo



