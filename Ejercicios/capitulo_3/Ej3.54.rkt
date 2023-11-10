#lang racket
;Define a procedure mul-streams, analogous to add-streams, that produces the elementwise
;product of its two input streams. Use this together with the stream of integers to complete the
;following definition of the stream whose nth element (counting from 0) is n + 1 factorial:

;Definimos las funciones que establecen los numeros enteros
(define (integers-starting-from n)
  (stream-cons 
   n (integers-starting-from (+ n 1))))
(define integers (integers-starting-from 1))


(define (mul-streams s1 s2) ;toma dos argumentos s1 y s2
  (if (stream-empty? s1) ;si s1 está vacio, devuelve un stream vacio
      empty-stream
      (stream-cons (* (stream-first s1) (stream-first s2));si no, realiza la multiplicacion elemento por elemento de s1 y s2
                   (mul-streams (stream-rest s1) (stream-rest s2)))));el resultado se guarda como primer elemento de la nueva lista, y asi sucesivamente.
;se llama otra vez a la funcion con el resto de elemtnos de s1 y s2

 (define factorials  (stream-cons 1  ;define la funcion de los factoriales, empezando por 1 que es el factorial de 0
       (mul-streams factorials (stream-rest (integers-starting-from 1)))));la funcion llama a mul-streams para calcular los siguientes elementos de los
;de los numeros enteros emezando desde 1.
;Mult-streams toma dos secuencias, la de los numeros factoriales ya calculados y la de los numeros enteros

;Comprobacion de que funciona el calculo de factorial
(print (stream-ref factorials 0))
(newline)
(print (stream-ref factorials 1))
(newline)
(print (stream-ref factorials 2))
(newline)
(print (stream-ref factorials 3))
(newline)
(print (stream-ref factorials 4))
(newline)
(print (stream-ref factorials 5))
(newline)
(print (stream-ref factorials 6))
(newline)
(print (stream-ref factorials 7))
(newline)
(print (stream-ref factorials 8))
(newline)
(print (stream-ref factorials 9))
(newline)
(print (stream-ref factorials 10))


