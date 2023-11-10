#lang scheme

(define (count-pairs x)
  (if (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1)))


(define n1 (mcons 2 null))
(define n2 (mcons n1 n1)) ; ((2 null) (2 null))
(define n3 (mcons n1 (mcons n1 0))) ; ((2 null) ((2 null) 0))
(define n4 (mcons n2 n2)) ; (((2 null) (2 null)) ((2 null)(2 null)))
(count-pairs n2)
(count-pairs n3)
(count-pairs n4)

; The algorithm counts pairs at all levels of the list