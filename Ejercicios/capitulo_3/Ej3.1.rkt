#lang racket

 (define (make-accumulator valorInicial);la funcion toma un valor inicial
  (let ((sum valorInicial));creamos una variable local inicializada con el valor incial
    (define (acumulador n) ;dentro definimos una funcion que toma un valor n 
      (set! sum (+ sum n));dentro de la funcion, actualizamos sum sumando n al valor actual de sum y lo almacenamos en sum
      sum)
   acumulador))
;utilizamos set! ya que cada vez que llamamos al define, se crea una variable nueva
;al utilizar set!, mantenemos siempre la misma variable

(define A (make-accumulator 5))

(A 10)
15

(A 10)
25