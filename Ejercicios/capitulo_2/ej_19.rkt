#lang scheme
; el progrma cuenta los cambios de monedas de USA y lo que se pide es modificarlo para que
;maneje cualquier tipo de forma

;codigo modificado:

(define (cc amount coin-values)
  (cond ((= amount 0)
         1)
        ((or (< amount 0)
             (no-more? coin-values))
         0)
        (else
         (+ (cc amount (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values)) coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (no-more? coin-values)
  (null? coin-values))

;diferentes formas de probarlo

(define us-coins 
  (list 50 25 10 5 1))

(define uk-coins 
  (list 100 50 20 10 5 2 1 0.5))

(display "Prueba 1 (Dolares): ")
(display (cc 10 us-coins)) ; Debería imprimir 4 (10c = 10x1c, 5x1c+5c, 5c+5x1c, 10x1c)
(newline)

(display "Prueba 2 (Libras): ")
(display (cc 100 uk-coins)) ; Debería imprimir 104561
(newline)

(display "Prueba 3 (caso de que sea negativo): ")
(display (cc -10 us-coins)) ; Debería imprimir 0 (Cantidad negativa)
(newline)
