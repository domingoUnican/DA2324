#lang racket
;Ejer 1.42

(define (compose f g)
  (lamda (n) (f (g n))))