#lang racket


(define (equal? x y)
  (cond ((and (null? x) (null? y)) #t) ; Miro si los dos son nulos
        ((or (symbol? x) (number? x)) ; X es un simbolo o un numero
         (and (eq? x y))) ; Miro si x e y son iguales
        ((and (pair? x)) ; Miro si x es una lista
         (and (equal? (car x) (car y)) 
              (equal? (cdr x) (cdr y)))) ; Miro la lista elemento a elemento
        (else #f))) ; Si no se cumple ninguna condicion anterior, falso


; Ejemplos
(display (equal? '(lista) '(lista))) ;true
(display (equal? '(lista) '(listas))) ;false
(display (equal? 4 4)) ;true
(display (equal? 4245 4453)) ;false 
(display (equal? null null)) ;true


