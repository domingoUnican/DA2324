#lang racket
(define (nil) '())
(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(square-list (list 1 2 3 4))

; No funcionna dado que esta funcionando como una pila
; en el 'cons' final el siguiente cuadrado se esta ateponiendo a la solucion total

(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(square-list2 (list 1 2 3 4))

; Esta solucion funciona a la hora de poner el orden deseado, pero comete un error
; y es que está añadiendo listas en listas dado que answer ya es una lista y se añade dentro de otra lista n veces