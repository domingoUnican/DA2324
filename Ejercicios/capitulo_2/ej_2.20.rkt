#lang racket
(define (concatenar lista1 lista2)
  (if (null? lista1)
      lista2
      (cons (car lista1) (concatenar (cdr lista1) lista2))))

(define (same-parity  x . y)
  (define (h lista)
    (cond ((null? lista) null)
    (((if (even? x) even? odd?) (car lista))
        (concatenar (cons (car lista) null) (h (cdr lista))))
    (else (h (cdr lista)))))        
  (if (null? y)
      x
      (h (cons x y))))

(same-parity 1 2 3 4 5 6 7)
    
        
        