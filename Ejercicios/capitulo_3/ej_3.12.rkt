#lang racket
(define (mappend x y)
  (if (null? x)
      y
      (mcons (mcar x) (mappend (mcdr x) y))))

(define (append! x y)
  (set-mcdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (mcdr x))
      x
      (last-pair (mcdr x))))

(define x (mcons 'a (mcons 'b null)))
(define y (mcons 'c (mcons 'd null)))
(define z (mappend x y))

z
;(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(mcdr x) ; (mcons 'b '())

(define w (append! x y))

w
;(mcons 'a (mcons 'b (mcons 'c (mcons 'd '()))))

(mcdr x) ; (mcons 'b (mcons 'c (mcons 'd '())))