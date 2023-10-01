#lang racket
(define (square-list items);
   (if (null? items);comprueba si está vacía
       null;retorna null
       (cons (* (car items) (car items));si no, se multiplica el primer elemento por si mismo
             (square-list (cdr items)))));se llama recursivamente a square-list del siguiente elemento
(display (square-list (list 1 2 3 4 )))
(newline)

(define (map proc items);funcion mapa
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-map items);funcion square-list con mapeo
  (map (lambda (x) (* x x)) items));le pasamos una funcion que le calcula el cuadrado y la lista

(display (square-list-map (list 1 2 3 4 )))