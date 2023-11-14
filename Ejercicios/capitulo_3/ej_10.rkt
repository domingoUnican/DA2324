#lang racket

(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance 
                       (- balance amount))
                 balance)
          "Insufficient funds"))))

(define w (make-withdraw 100))

; global:
;     make-withdraw: (λ initial-amount)
; E1 (w/make-withdraw):
;     initial-amount: 100
;   E2 (w/make-withdraw/let):
;       balance: 100

(w 0)

; global:
;     make-withdraw: (λ initial-amount)
;     w: (λ amount) (w/make-withdraw/let)
; E1 (w/make-withdraw/let 0):
;     amount: 0
;     balance: 100

(w 10)

; global:
;     make-withdraw: (λ initial-amount)
;     w: (λ amount) (w/make-withdraw/let)
; E1 (w/make-withdraw/let 10):
;     amount: 10
;     balance: 100

(w 50)

; global:
;     make-withdraw: (λ initial-amount)
;     w: (λ amount) (w/make-withdraw/let)
; E1 (w/make-withdraw/let 50):
;     amount: 50
;     balance: 90

(w 50)

; global:
;     make-withdraw: (λ initial-amount)
;     w: (λ amount) (w/make-withdraw/let)
; E1 (w/make-withdraw/let 50):
;     amount: 50
;     balance: 40