#lang racket
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y); concatena las dos listas, recorre las dos listas añadiendo cada elemento en una nueva lista la cual devuelve
(cons x y)  ; cons añade un elemento a una lista, al pasarle dos listas al cons añades una lista dentro de otra lista
(list x y)  ; crea una lista con las dos lista. Seria el equivalente a realizar (cons x (cons Y nil))