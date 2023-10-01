#lang racket

(define (same-parity primerValor . lista)
    (filter (if (even? primerValor)
                even?
                odd?) 
            (cons primerValor lista)))

(display (same-parity  1 2 3 4 5 6 7))