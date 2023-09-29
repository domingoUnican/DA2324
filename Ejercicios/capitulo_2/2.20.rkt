#lang racket
; Funcion que comprueba si un numero es par
(define (espar x)
  (if (= (remainder x 2) 0)
      #t
      #f
))

; Procedimiento auxiliar que devuelve la lista
; con elementos de misma paridad
(define (aux proc y)
  (cond ((null? y) null)
        ((proc (car y)) (cons (car y) (aux proc (cdr y))))
        (else (aux proc (cdr y))))
  )

; Funcion que devuelva la lista con elementos
; de misma paridad que el primer elemento
(define (same-parity x . y)
  (if (espar x)
      (cons x (aux even? y))
      (cons x (aux odd? y))))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)