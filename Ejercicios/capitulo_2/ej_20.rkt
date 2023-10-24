#lang scheme
(define (same-parity x . args)
  (define (same-parity-helper lst)
    (cond ((null? lst) '())
          ((= (remainder x 2) (remainder (car lst) 2))
           (cons (car lst) (same-parity-helper (cdr lst))))
          (else (same-parity-helper (cdr lst)))))
  
  (cons x (same-parity-helper args)))

; Explicacion:
; La función same-parity utiliza same-parity-helper, que es una función auxiliar
; recursiva. Lo que hace es comparar la paridad de x con la
; paridad de cada elemento en la lista args, y despues solo va a mantener
; los elementos que tienen la misma paridad que x. Luego concatena
; la x al principio de esa lista nueva

;Ejemplo del libro 
(display (same-parity 1 2 3 4 5 6 7)) ; Debería imprimir (1 3 5 7)
(newline)

(display (same-parity 2 3 4 5 6 7)) ; Debería imprimir (2 4 6)
(newline)
