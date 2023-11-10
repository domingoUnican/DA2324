#lang racket
;Without running the program, describe the elements of the stream defined by
(define s (stream-cons 1 (add-streams s s)))


;El primer elemento de la secuencia s es 1.

;El segundo elemento de la secuencia s es el resultado de agregar los primeros dos elementos de s,
;que son ambos 1. Por lo tanto, el segundo elemento es 1 + 1 = 2.

;El tercer elemento de la secuencia s es el resultado de agregar los primeros tres elementos de s,
;que son 1, 1, y 2. Por lo tanto, el tercer elemento es 1 + 1 + 2 = 4.

;Conclusion, este patron continua con los elementos de s, la secuencia esta formada por potencias de 2