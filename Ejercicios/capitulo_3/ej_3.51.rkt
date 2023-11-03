#lang racket
(define (display-line x)
  (newline)
  (display (force x)))

;(define (cons-stream a b) (cons (delay a) (delay b)))
;(define (stream-car s) (car s))
;(define (stream-cdr s) (force (cdr s)))

(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (stream-ref s n)
  (if (= n 0)
      (stream-first s)
      (stream-ref (stream-rest s) (- n 1))))

(define (stream-map proc s)
    (if (stream-empty? s) 
        empty-stream
        (stream-cons (proc (stream-first s))
                     (stream-map proc (stream-rest s)))))

(define (show x)
  (display-line x)
  x)

(define x 
  (stream-map 
   show 
   (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)

; x esta definido como show aplicado a 0..10, pero como usamos streams, esa funcion no se evalua hasta que la necesitemos
; Cuando stream-ref recorre el stream hasta llegar a n solo evalua ese