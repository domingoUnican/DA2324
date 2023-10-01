#lang scheme

; Collatz func
(define (collatz n)
  (if (= n 1)
      n
      (if (even? n)
          (/ n 2)
          (+ (* 3 n) 1))))

(define (rec n)
  (if (= n 1)
      1
      (rec (collatz n))))
