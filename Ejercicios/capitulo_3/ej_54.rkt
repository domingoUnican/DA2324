#lang racket
(require racket/stream)

;(define (stream-car stream) (car stream))
;(define (stream-cdr stream) (force (cdr stream)))


(define (stream-ref s n)
  (if (= n 0)
      (stream-first s)
      (stream-ref (stream-rest s) (- n 1))))

(define (stream-map proc s)
  (if (stream-empty? s)
      empty-stream
      (stream-cons
       (proc (stream-first s))
       (stream-map proc (stream-rest s)))))

(define (stream-for-each proc s)
  (if (stream-empty? s)
      'done
      (begin 
        (proc (stream-first s))
        (stream-for-each proc 
                         (stream-rest s)))))


(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))


(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))


(define (show x)
  (display-line x)
  x)



(define sum 0)

(define (accum x)
  ; (newline) (display "accum ") (display x)
  (set! sum (+ x sum))
  sum)

(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))


(define (mul-streams a b)
  (if (or (stream-empty? a) (stream-empty? b))
      empty-stream
      (stream-cons
        (* (stream-first a) (stream-first b))
        (mul-streams (stream-rest a) (stream-rest b)))))

(define (integers-from n)
  (stream-cons
    n
    (integers-from (+ n 1))))

(define integers (integers-from 1))

(stream-ref integers 0)
(stream-ref integers 1)
(stream-ref integers 2)
(stream-ref integers 3)
(stream-ref integers 4)

(define factorials 
  (stream-cons 1 (mul-streams factorials integers)))

(stream-ref factorials 0)
(stream-ref factorials 1)
(stream-ref factorials 2)
(stream-ref factorials 3)
(stream-ref factorials 4)
(stream-ref factorials 5)
(stream-ref factorials 6)
(stream-ref factorials 7)
