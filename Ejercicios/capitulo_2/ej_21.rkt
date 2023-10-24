#lang scheme

; Test lists
(define test-list1 (list 1 2 3 4))
(define test-list2 (list 0 5 10))


; Square list 1 (maps x -> x^2)
(define (square-list items)
  (if (null? items)
      '() ; Lista vacía
      (cons (* (car items) (car items)) ; Cuadrado del primer elemento
            (square-list (cdr items))))) ; Llamada recursiva con el resto de la lista

; Prueba resultado
(define result1 (square-list test-list1))
(display result1) ; Debería imprimir (1 4 9 16)
(newline)

(define result2 (square-list test-list2))
(display result2) ; Debería imprimir (0 25 100)
(newline)



; Square list 2 (maps x -> x^2)
(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

; Prueba resultado
(define result3 (square-list-map test-list1))
(display result3) ; Debería imprimir (1 4 9 16)
(newline)

(define result4 (square-list-map test-list2))
(display result4) ; Debería imprimir (0 25 100)
(newline)
