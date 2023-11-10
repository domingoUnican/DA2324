#lang racket
(define (stream-car stream) 
  (car stream))

(define (stream-cdr stream) 
  (force (cdr stream)))

(define (stream-map proc . argstreams)
  (if (null? (car argstreams))
      empty-stream
      (stream-cons
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc 
                    (map stream-cdr
                         argstreams))))))


(define (add1 x)
  (+ x 1))

(define numeros (stream 1 2 3 4 5))

(define numeros2 (stream-map add1 numeros))

