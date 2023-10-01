#lang racket
(define (for-each proc items)
  (if (null? items)
      null  ; Si la lista está vacía, se retorna null.
      (begin (proc (car items))  ; Aplicar la función proc al primer elemento de la lista.
        (for-each proc (cdr items)))));llamamos recursivamente al resto de elementos de la lista.


(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))