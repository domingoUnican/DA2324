#lang racket

(define (enumerate-interval start stop)
    (if (> start stop)
        empty-stream
        (stream-cons start 
                     (enumerate-interval (+ start 1) stop))))

(define (stream-map proc s)
    (if (stream-empty? s) 
        empty-stream
        (stream-cons (proc (stream-first s))
                     (stream-map proc (stream-rest s)))))

(define (stream-sum s)
    (if (stream-empty? s)
        0
	(+ (stream-first s) (stream-sum (stream-rest s)))))


; Exercise
(define (show x)
  (display x)
  x)

(define x 
  (stream-map 
   show 
   (enumerate-interval 1 10)))

; Stream-ref only evaluates the nth expression in the stream x
; Stream-map receives two arguments: a procedure (show) and a stream (enumerate-interval 0 10)
; We could consider stream-map as a "linked list" where each element contains the raw evaluation
; of the procedure over the corresponding value of the range and a pointer to
; the remainding elements of the stream-map. We go through this list
; and evaluate the desired expression when reached.
; The value is printed twice, the fisrt because of the display whereas the second is due to
; the returned value.
(stream-ref x 5)
(stream-ref x 7)