#lang racket
(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (map-square-list items)
  (map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4))
(map-square-list (list 1 2 3 4))


