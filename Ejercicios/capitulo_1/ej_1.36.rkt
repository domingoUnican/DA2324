#lang racket

;ejer 1.36:


(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;(fixed-point (lambda (n) (/ (log 1000) (log n))) 2)

;(fixed-point (lambda (n) (average (log n) (/ (log 1000) (log n)))) 2)