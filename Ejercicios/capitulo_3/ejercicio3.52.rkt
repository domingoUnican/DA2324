#lang racket
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (display-line x)
  (newline)
  (display x))

(define (display-stream s)
  (stream-for-each display-line s))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum) ;; sum => 0

(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20))) ;; sum => 1

(define y (stream-filter even? seq)) ;; sum => 6

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq)) ;; sum => 10

(stream-ref y 7);; sum => 136 || printed response: 136 
(display-stream z);; sum => 210 || printed response:(10 15 45 55 105 120 190 210)