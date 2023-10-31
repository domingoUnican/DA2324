#lang racket

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


(define (display-stream s)
  (stream-for-each display-line s))

(define (show x)
  (display-line x)
  x)

(define x
  (stream-map
   show
   (stream-enumerate-interval 0 10)))



(stream-ref x 5)
; devuelve 55
(stream-ref x 7)
;devuelve 77



;te devuelve dos números, uno es el numero que tu le pasas a la función
;el otro es el numero del stream que esta en la posicion dada.

;no se muestran los demas numeros dado que las funciones, implementan delay y force
;de tal manera que todos los elementos del stream se encuentran en dalay
;menos el elemento en la posicion que se le pasa que está en force y por esto es el unico que se devuelve