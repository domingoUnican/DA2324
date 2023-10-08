#lang racket
(list 'a 'b 'c);contiene una lista con los elementos a b y c como simbolos 
(list (list 'george));Lista de una lista con un simbolo george.
(cdr '((x1 x2) (y1 y2)));devuelve el segundo elemento de la lista, creada con un quote 
(cadr '((x1 x2) (y1 y2)));es el car de cdr, es decir, devuelve el el segundo elemento de la lista (y1 y2).
(pair? (car '(a short list)));comprueba si el resultado de la expresion es par, como (car '(a short list) devuelve a, dará falso ya que no es un par.
(memq 'red '((red shoes) (blue socks)));busca el elemento red dentro de la lista, y devuelve la lista que lo contiene, en este caso, la lista es de pares,
;y no encuentra coincidencia
(memq 'red '(red shoes blue socks));en este caso si la encuentra y retorna la lista que contiene red.
