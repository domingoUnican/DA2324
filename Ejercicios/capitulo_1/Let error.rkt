#lang scheme

; Let fails because "a" only has a value in the expression
; to be evaluated "(+ a b)" and not in the previous
; assignment expressions
(define (f x)
  (let ((a (+ x 10))
        (b (* a 5)))
    (+ a b))
)

(f 2)