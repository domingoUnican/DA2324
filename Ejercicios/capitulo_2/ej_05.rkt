#lang scheme

; EXERCISE IN SEPARATE FUNCTIONS
; Numerador
(define (numerador x)
  (if (even? x)
      (+ 1 (numerador (/ x 2)))
      0))

; Denominador
(define (denominador x)
  (if (= 0 (remainder x 3))
      (+ 1 (denominador (/ x 3)))
      0))


; EXERCISE IN ONE FUNCTION
(define (transform x)
  (transform-rec x 0 0))

(define (transform-rec x a b)
  (if (even? x)
      (transform-rec (/ x 2) (+ a 1) b)
      (if (= 0 (remainder x 3))
          (transform-rec (/ x 3) a (+ b 1))
          (cons a b))))

; Calcualte pair
; Input: int
; Output: (2^n * 3^m) = input
(define (calc-pair x)
  (newline)
  (display "(2^")
  (display (car (transform x)))
  (display " * 3^")
  (display (cdr (transform x)))
  (display ")"))


(calc-pair 96)


