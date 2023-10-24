#lang scheme

; Devuelve otra funcion que es la composicion de f despues de g
(define (compose f g)
  (lambda (x) (f (g x))))

; Procedimiento recursivo que aplica repetidamente la funcion f n veces
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1))))) ; compone a f con ella misma


; Para calcular la n-esima aplicacion se usara el procedimient repeated
; Prueba con ejemplos de ejercicios anteriores, incremento y square
(define (square x)
  (* x x))
(define (inc x)
  (+ x 1))


; Se llama al procedimeinto repeated y se le pasa la funcion
; square con un valor de 2, lo que hace que devuelva 2^2
(define repeated-square (repeated square 2))

; Repeated-inc incrementara en 1 n veces
(define repeated-inc (repeated inc 3))

(repeated-square 5) ; debe devolver 625 (5^4)
(repeated-inc 5)    ; debe devolver 8 (5 + 1 + 1 + 1)
