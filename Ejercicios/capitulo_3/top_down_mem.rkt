#lang racket
(define (top-down n k memoria)
  (cond ((or (= n 0) (= n 1)) 1)
        ((= k 0) 0)
        ((= k 1) 1)
        ((= n 2) 2)
        ((> k n) (top-down n n memoria))
        ((not (null? (hash-ref memoria (list n k) null))) (hash-ref memoria (list n k)))
        (else
         (hash-set! memoria (list n k)(+ (top-down n (- k 1) memoria) (top-down (- n k) k memoria)))
         (hash-ref memoria (list n k))
         )))

(define memoria (make-hash))

(display (top-down 7 4 memoria))
(newline)
(display (top-down 11 6 memoria))
(newline)
(display (top-down 8 5 memoria))
