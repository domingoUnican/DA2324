#lang racket
(define (display-line x)
  (newline)
  (display (force x)))

(define (display-stream s)
  (stream-for-each display-line s))

(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))

(stream-ref y 7)
(display-stream z)

; El impacto que tiene la implementación de delay es el número de ejecuciones del procedimiento.
; Con la implementacion con lambda se tiene que evaluar el procedimiento cada vez que se observa el elemento,
; mientras que de la otra forma se queda guardado en memoria la primera vez que se calcula.