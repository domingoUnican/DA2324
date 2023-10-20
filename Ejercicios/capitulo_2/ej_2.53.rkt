#lang racket
(list 'a 'b 'c) ; lista de a,b y c como simbolos
(list (list 'george)) ; lista de lista de george
(cdr '((x1 x2) (y1 y2))) ;segundo elemento de entre (x1 x2) y (y1 y2),
; lo devuelve como puntero a lista ((y1 y2))
(cadr '((x1 x2) (y1 y2))) ; car de la lista cdr, (y1 y2)
(pair? (car '(a short list))) ; es falso porque car de esa lista es el primer elemento, cdr sí es una lista de dos
(memq 'red '((red shoes) (blue socks))) ; no contiene red, porque el elemento es (red shoes)
(memq 'red '(red shoes blue socks)) ;encuentra red, por lo que devuelve la lista a partir de su primera ocurrencia