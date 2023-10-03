#lang racket
;Ejer 2.6
(define (zero f)(lambda (x) x))

(define (uno f) (lambda (x) (f x)))
(define (dos f) (lambda (x) (f (f x))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc x)
  (+ x 1))

;((uno inc) 0)
;((dos inc) 0)

      
