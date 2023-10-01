#lang racket
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y);devuelve la primera lista concatenada con la segunda lista, esto es, pone el puntero del ultimo elemento de x al primer elemento de y
(cons x y);en este caso coloca los elementos de la lista x al frente de la lista y. Ahora el primer elemento de la lista y son todos los elementos de x.
(list x y);en este caso se está creando una lista de listas.