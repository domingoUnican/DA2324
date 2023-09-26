#lang racket
; Normalmente cuando queremos encontrar un valor de una función
; es más comodo definir el problema como encontrar un punto fijo de otra función
; equivalente.
(define (collazt n)
  (if (= n 1)
      n
      (if (even? n)
          (/ n 2)
          (+ (* 3 n) 1))))

(define 11)
(define (rec n)
  (if (= n 1)
      1
      (rec (collatz n))))