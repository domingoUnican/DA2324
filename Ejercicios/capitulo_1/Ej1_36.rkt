#lang racket
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline) ; Agregamos una nueva línea antes de mostrar la aproximación
    (display guess) ; Mostramos la aproximación actual
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (begin
            (try next)))))
  (try first-guess))

(define (calculo x)
  (/ (log 1000)(log x))) ;log(1000)/ log(x)

(display (fixed-point calculo 2.0))