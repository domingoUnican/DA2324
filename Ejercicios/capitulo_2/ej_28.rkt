#lang scheme

; Fringe
(define (fringe tree)
  (cond ((null? tree) '()) 
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) ;llama al primer hijo.
                      (fringe (cdr tree)))))) ; Llama el resto de los hijos.

(define x 
  (list (list 1 2) (list 3 4)))

(display (fringe x))
; Debería imprimir: (1 2 3 4)
(newline)

(define y (list x x))

(display (fringe y))
; Debería imprimir: (1 2 3 4 1 2 3 4)
(newline)
