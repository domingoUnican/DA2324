#lang racket

(list 'a 'b 'c) ; Retorna (a,b,c) que es una lista de simbolos
(list (list 'george)) ; Retorna ((george)) porque define una lista de listas
(cdr '((x1 x2) (y1 y2))) ; Retorna '((y1 y2)) porque define una lista de listas donde el primer elemento es '(x1 x2) y el resto que es lo que coge cdr que es '(y1 y2)
(cadr '((x1 x2) (y1 y2))) ; Retorna (y1,y2) porque coge el (car (cdr '((x1 x2) (y1 y2)))) entonces el cdr como vimos antes retornaba '((y1 y2)) y el primer elemento es (y1 y2)
(pair? (car '(a short list))) ; Retorna false porque se define una lista que es (a short list) y de ahí el car sería el primer elemento que es a y por tanto no sería una lista porque no estaría cogiendo el puntero al resto
(memq 'red '((red shoes) (blue socks))) ; Retorna false porque se define una lista de listas que es ((red shoes) (blue socks)) donde no se encuentra el elemento buscado 'red porque el elemento que esta es (red shoes)
(memq 'red '(red shoes blue socks)) ; Retorna '(red shoes blue shocks) porque se define una lista con (red shoes blue socks) y en dicha lista se encuentra el elemento red y por tanto retorna
; a partir de ese elemento el resto de la lista que es '(red shoes blue socks)
