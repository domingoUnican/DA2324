#lang scheme

; Sumatorio recursivo
; funcion: resultado
; siguiente: funcion incremental
(define (sum funcion a b siguiente)
  (if (> a b)
      0
      (+ (funcion a) (sum funcion (siguiente a) b siguiente))))

; Suma de numeros pares
(sum (lambda (n) n) 0 6 (lambda (n) (+ n 2)))

; Suma de potencias de 2
(sum (lambda (n) n) 1 6 (lambda (n) (* n 2)))




; Sumatorio iterativo
; funcion: resultado
; siguiente: funcion incremental
(define (sum-iter funcion a b siguiente)
  (define (iter a result)
    (if (> a b)
        result
        (iter (siguiente a) (+ result (funcion a)))
    )
  )
(iter a 0))

; Sumatorio normal
(sum-iter (lambda (n) n) 1 5 (lambda (n) (+ n 1)))
      
    
 





