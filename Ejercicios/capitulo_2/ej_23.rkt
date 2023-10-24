#lang scheme

; For-each
(define (for-each procedure items)
  (if (null? items)
      null 
      (begin
        (procedure (car items)) ; Aplica el procedimiento al primer elemento
        (for-each procedure (cdr items))))) ; Llamada recursiva con el resto de la lista

; Test
(for-each (lambda (x) (newline) (display (* x 2))) (list 57 321 88))