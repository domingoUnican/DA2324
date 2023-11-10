#lang racket
(define (add-stream s1 s2)
  (if (stream-null? s1)
      s2
      (if (stream-null? s2)
          s1
          (stream-cons (+ (stream-car s1) (stream-car s2))
                       (add-stream (stream-cdr s1) (stream-cdr s2))))))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (stream-cons a b)
  (cons a (delay b)))

(define (stream-null? stream)
  (null? stream))

(define s (stream-cons 1 (add-stream s s))) ; s produce una secuencia de potencias de 2, similar al ejemplo de la secuencia de duplicación