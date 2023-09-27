#lang racket

(define (TRUE x y) x)
(define (FALSE x y) y)

(define (NOT x) (x FALSE TRUE))
; x = T | F
; r = F | T
; Lo que se hace simplemente es cambiar el simbolo

(define (AND x y) (x y FALSE))
; x =   | T | F
; y = T | T   F
; y = F | F   F
; Solo es True si x e y son true
; Cualquier otra opción es false

(define (OR x y) (x TRUE y))
; x =   | T | F
; y = T | T   T
; y = F | T   F
; Solo es false si x e y son false
;cualquier otra opción es true

; Example
(NOT TRUE)         ;-> FALSE
(NOT FALSE)        ;-> TRUE
(AND TRUE TRUE)    ;-> TRUE
(AND TRUE FALSE)   ;-> FALSE
(OR  TRUE FALSE)   ;-> TRUE
(OR  FALSE FALSE)  ;-> FALSE


