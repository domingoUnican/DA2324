#lang scheme
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance 
                        amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                        MAKE-ACCOUNT" 
                       m))))
  dispatch)


(define acc (make-account 50)); Esto crea una nueva cuenta llamada "acc"
;con un saldo inicial de 50. El estado local de esta
;cuenta se mantiene en la variable "balance" dentro del
;procedimiento "make-account" de "acc."

((acc 'deposit) 40); Aquí estás depositando 40 unidades en la cuenta "acc,"
;y el saldo se actualiza a 90. El estado local de "acc" se mantiene en
;su propio entorno.

((acc 'withdraw) 60) ;Luego, retiras 60 unidades de la cuenta "acc," y
;el saldo se reduce a 30. El estado local de "acc" sigue siendo independiente.


;que pasa cuando defines otra cuenta
(define acc2 (make-account 100))

;Estás creando una cuenta separada llamada "acc2" con un saldo inicial de 100.
;Las partes del entorno que son compartidas entre "acc" y "acc2" son las
;definiciones de las funciones "withdraw" y "deposit" en el procedimiento
;"make-account." Estas funciones son idénticas para ambas cuentas, ya que se
;definen dentro de la misma función "make-account."

;Sin embargo, el estado local, es decir, la variable "balance,"
;se mantiene completamente independiente para "acc" y "acc2."
;Cada cuenta tiene su propia copia de la variable "balance,"
;lo que permite que los saldos se mantengan separados y distintos entre
;las dos cuentas.