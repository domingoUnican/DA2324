#lang racket

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op 
                      initial 
                      (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3)) ; Opera de derecha a izqda y al final queda 3/2
(fold-left  / 1 (list 1 2 3)) ; Opera de izqda a derecha y al final queda 1/6
(fold-right list null (list 1 2 3)) ; Al operar de derecha a izqda devuelve la lista vacia al final '(1 (2 (3 ())))
(fold-left  list null (list 1 2 3)) ; Al operar de izqda a derecha devuelve la lista vacia al principio '(((() 1) 2) 3)

; La diferencia entre el fold-right y el left es que en el fold-right no se almacena la operacion realizada entre cada par de numeros
; sino que opera hasta que llega al final de la lista y luego tiene q volver para atras y terminar de operarlo desde el caso base como un algoritmo recursvo

; Sin embargo, el fold-left actua de forma iterativa porque la operacion realizada entre cada par de numeros se almacena en la variable
; result de forma que la lista solo se recorre una vez y por tanto hace las operaciones una sola vez y es más eficiente
