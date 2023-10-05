#lang scheme

; Triangulo de Pascal

; n: Numero de filas a calcular
(define (pascal-triangle n)
  (define (binomial-coef n k)
    (if (or (= k 0) (= k n))
        1
        (+ (binomial-coef (- n 1) (- k 1))
           (binomial-coef (- n 1) k))))
  
  (define (print-row row)
    (define (print-coefficient k)
      (display (binomial-coef row k))
      (display " "))
    
    (do ((k 0 (+ k 1)))
        ((= k row))
      (print-coefficient k))
    (newline))
  
  (do ((row 0 (+ row 1)))
      ((= row n))
    (display "   ")
    (print-row row)))


(pascal-triangle 8)

  