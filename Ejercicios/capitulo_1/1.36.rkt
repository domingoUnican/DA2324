#lang racket

; Con la misma tolerancia
(define tolerance 0.00001)

; Calcula la media
(define (average x y)
  (/ (+ x y) 2))

; Cambiamos la función fixed-point
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Sin damping
(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)) (newline)

; Con damping
(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)) (newline)

; Observamos que tarda menos en converger con damping ya que solo tarda 10 iteraciones y sin damping tarda mas en converger
; ya que tarda 35 iteraciones
