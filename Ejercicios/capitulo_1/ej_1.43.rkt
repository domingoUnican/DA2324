#lang scheme
; procedimiento recursivo que lo que hará será aplique repetidamente f a su entrada n veces
(define (compose f g)
  (lambda (x) (f (g x)))) ; dvuelve otra funcion que es la composicion de f despues de g

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1))))) ; compone a f con ella misma


; para calcular la n-esima aplicacion se usara el procedimient repeated
; probar con ejemplos de ejercicios anteriores, incremento y square
(define (square x)
  (* x x))
(define (inc x)
  (+ x 1))

(define repeated-square (repeated square 2)); basicamente es llama al procedimeinto repeated se le pasa la funcion
; square con un valor de 2 y esto hace tal que devuelve 2*2 que es 4. 
(define repeated-inc (repeated inc 3))

(repeated-square 5) ; debe devolver 625 (5^4)
(repeated-inc 5)    ; debe devolver 8 (5 + 1 + 1 + 1)
