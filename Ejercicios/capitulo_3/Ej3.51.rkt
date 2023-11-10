#lang racket
;Exercise 3.51: In order to take a closer look at delayed evaluation, we will use the following procedure,
;which simply returns its argument after printing it:
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (display-line x)
  (newline)
  (display x))

(define (show x)
  (display-line x)
  x)
;La funcion show toma x, lo imprime usando display-line y luego devuelve x.

;What does the interpreter print in response to evaluating each expression in the following sequence? footnote

(define x 
  (stream-map 
   show 
   (stream-enumerate-interval 0 10)))

;La función stream-map aplica show a cada elemento
;en la secuencia generada por la funcion stream-enumerate-interval.

(stream-ref x 5)

(stream-ref x 7)

;en ambos casos te devuelven dos números, uno por la llamada al show que imprime el numero antes de devolverlo y otro por la funcion stream.