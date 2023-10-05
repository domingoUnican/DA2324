#lang racket
(define (make-point x y) (cons x y))
(define (x-point p) (car p)) 
(define (y-point p) (cdr p))

(define (make-segment start-segment end-segment) (cons start-segment end-segment))

(define (average x y) 
  (/ (+ x y) 2))

(define (midpoint-segment line)
  (cons (average (car (car line)) (car (cdr line)))
        (average (cdr (car line)) (cdr (cdr line)))))
  

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;(midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))) retorna (1 . 1)