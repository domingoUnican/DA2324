#lang racket
(define (make-point x y) (cons x y));creamos el par con x y
(define (x-point p) (car p));devolvemos el x de p
(define (y-point p) (cdr p));devolvemos el y de p

(define (make-segment i f) (cons i f));creamos el par segmento con i y f
(define (start-segment s) (car s));devolvemos el comienzo del segmento
(define (end-segment s) (cdr s));devolvemos el final de segmento

(define (midpoint-segment s);calcula el punto medio de los puntos que se le pasan
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2) 
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2))) 

(define (print-point p);funcion que imprime los puntos
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define i (make-point 3 4));creamos un punto con las coordenadas 3,4
(define f (make-point 5 6));creamos otro punto con as coordenadas 5,6
(define s (make-segment i f));definimos un segmento que va desde los dos puntos anteriores

(print-point (midpoint-segment s));imprimimos el punto medio de los puntos dados.
