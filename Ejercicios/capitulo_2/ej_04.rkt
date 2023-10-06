#lang scheme

; Pair
(define (cons x y) 
  (lambda (m) (m x y)))

; car Pair
(define (car z) 
  (z (lambda (p q) p)))

; cdr Pair
(define (cdr z) 
  (z (lambda (p q) q)))

; Test
(print (car (cons 1 2)))
(print (cdr (cons 1 2)))