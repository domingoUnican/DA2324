#lang racket
;ejercicio 2.17
(define (list-pair lista)
    (if (null (cdr lista))
        lista
        (last-pair (cdr lista))))

(display (last-pair (list 23 72 149 34)))