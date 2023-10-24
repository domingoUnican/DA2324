#lang racket

(define (match pattern data)
  (cond
    ((null? pattern) (null? data))                 ; Ambos están vacíos
    ((null? data) #f)                             ; Los datos están vacíos, pero el patrón no lo está
    ((eq? (car pattern) (car data))               ; Coincide el primer elemento
     (display pattern) (display newline) (display data)
     (match (cdr pattern) (cdr data)))            ; Verificar el resto
    ((eq? (car pattern) '?)                       ; Coincide con cualquier cosa
     (display pattern) (display newline) (display data)
     (match (cdr pattern) (cdr data)))
    (else #f)))                                    ; No coincide, devolver falso

(define record '(job (Hacker Alyssa P) (computer programmer)))

(display (match '(job ? ?) record))             ; --> #t
(display (match '(job ? (? coder)) record))     ; --> #f
(display (match '(? ? (computer ?)) record))    ; --> #t
