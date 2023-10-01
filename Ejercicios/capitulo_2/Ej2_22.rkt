#lang racket
(define (square x)
  (* x x))

(define (reverse lista);funcion reverse del ejercicio 2.18 
  (rec lista '()))

(define (rec lista resultado);funcion recursiva que va añadiendo los valores a otra lista con el sentido inverso
  (if (null? lista)
      resultado ;si lista vacia significa que hemos terminado
      (rec (cdr lista) (cons (car lista) resultado))))

;una primera solucion que se nos ocurre es pasare la lista inversa, y aprovechar el codigo del ejercicio 2.18
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter (reverse items) null));lo que hacemos es pasarle la lista dada la vuelra

(display (square-list (list 1 2 3 4 )))

(newline)
;otra solución que se nos ocurre es usar la concatenación con append
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things);si la lista con los objetos a procesar esta vacia, hemos acabado
        answer;retornamos la lista procesada
        (iter (cdr things);llamamos recursivamente a iter con la cola de things 
              (append answer;lo combinamos con la lista que va a contener los cuadrados
                      (list (square (car things)))))));calculamos el cuadrado del primer elemnto de things
  (iter items null))
(display (square-list2 (list 1 2 3 4 5 6)))