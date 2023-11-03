#lang racket
(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))

;3
(define 3n0 (mcons 1 null))
(define 3n1 (mcons 1 null))
(define 3n2 (mcons 3n1 3n1))

(count-pairs 3n2)

;4
(define 4n0 (mcons 1 null))
(define 4n1 (mcons 4n0 null))
(define 4n2 (mcons 4n0 4n1))

(count-pairs 4n2)

;7
(define 7n0 (mcons 1 null))
(define 7n1 (mcons 7n0 7n0))
(define 7n2 (mcons 7n1 7n1))

(count-pairs 7n2)