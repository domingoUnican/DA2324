#lang scheme

; Original Function:
; if n < 3 then f(n) = n
; if n >= 3 then f(n) = f(n-1) + 2 * f(n-2) + 3 * f(n-3)

; Recursive function
(define (rec-process n)
  (if (< n 3)
      n
      (+ (rec-process (- n 1)) (* 2 (rec-process (- n 2))) (* 3 (rec-process (- n 3))))
   )
)


; Iterative function
(define (iter-process n r1 r2 r3)
  (if (< n 3)
      (+ r1 r2 r3)
      (+ (iter-process (- n 1) r1) (* 2 (iter-process (- n 2) r2)) (* 3 (iter-process (- n 3) r3)))
   )
)