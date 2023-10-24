#lang scheme

; Deep reverse
; Revierte recursivamente el orden de una lista y sus sublistas
(define (deep-reverse l)
  (if (null? l)
      '() 
      (if (list? (car l)) ; Si el primer elemento es una lista (sublista)
          (append (deep-reverse (cdr l)) ; Llamada recursiva a deep-reverse en el resto de la lista
                  (list (deep-reverse (car l)))) ; deep-reverse en la sublista y se agrega al resultado
          (append (deep-reverse (cdr l)) ; Llamada recursiva a deep-reverse en el resto de la lista
                  (list (car l)))))) ; El primer elemento se agrega al resultado

(define x 
  (list (list 1 2) (list 3 4)))

(display x)
; Debería imprimir: ((1 2) (3 4))
(newline)

(display (reverse x))
; Debería imprimir: ((3 4) (1 2))
(newline)

(display (deep-reverse x))
; Debería imprimir: ((4 3) (2 1))
(newline)
