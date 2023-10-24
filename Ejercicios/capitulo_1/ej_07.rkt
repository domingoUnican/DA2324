#lang scheme

; Square root by using good-enough method
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) (* guess 0.001)))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; It fails for small numbers. When the input is smaller than the
; good-enough range of error, the output will be the first calculation,
; even if it is far away from the correct result
(sqrt 0.0001)

; It also fails for big numbers because the space to store these data is
; limited so computers must approach those numbers (e.g., 2*e^100) and results
; can not be completely correct
(sqrt (expt 2 1000))
