#lang racket
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ; Appends y list to x list
(cons x y) ; Returns a list where the first element is x and the others are the 
           ; elements in y
(list x y) ; Returns a list with two elements, each of them being another list