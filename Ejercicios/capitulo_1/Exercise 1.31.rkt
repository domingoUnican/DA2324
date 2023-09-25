#lang racket


(define (product func a next b)
  (if (> a b)
      1
      (* (func a)
         (product func (next a) next b))))

(define (product_iter func a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a) (* (func a) result))))
  (iter a 1))


(define (factorial n)
  (product (lambda (n) n) 1 (lambda (n) (+ n 1)) n))

(define (factorial_iter n)
  (product_iter (lambda (n) n) 1 (lambda (n) (+ n 1)) n))

(factorial 5)
(factorial_iter 5)


;no hemos encontrado la manera de definr pi
