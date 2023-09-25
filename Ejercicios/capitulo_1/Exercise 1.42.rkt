#lang racket
(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))


(define (compose funcion1 funcion2)
  (lambda (valor)
    (funcion1(funcion2 valor))))

((compose (compose square inc) inc) 6)        