#lang scheme

; Factorial without defining functions
((lambda (x f) 
  (if (= x 1)
      1
      (* x (f (- x 1) f))))
6 (lambda (x f) 
  (if (= x 1)
      1
      (* x (f (- x 1) f)))))