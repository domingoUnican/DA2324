#lang scheme

;Function f(x) = 1 + 1/x
(define (func x)
  (+ 1 (/ 1 x)))

; When feeding the function with the golden ratio,
; the input and the output are the same so it is
; a fixed point.
(func (/ (+ 1 (sqrt 5)) 2))

; Fixed-point demonstration
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

 
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0)