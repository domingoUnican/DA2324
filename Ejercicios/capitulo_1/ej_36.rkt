#lang scheme

; Modified fixed-point
(define tolerance 0.00001)

(define (print-and-next-try try next)
  (newline)
  (display next)
  (newline)
  (try next))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (print-and-next-try try next))))
  (try first-guess))


; Test
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)