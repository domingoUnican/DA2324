#lang racket
;Aqui vendria el codigo 2B y 2C donde se definen los procedimientos de bob y alice
;create hash
(define registry (make-hash))

(define (register name tag proc)
   (hash-set! registry (list name tag) proc))
(define (lookup name tag)
   (hash-ref registry (list name tag)))

;type tag
(define (type-tag object)
  (car object))

; Register procedures widht
(register 'width 'bob-box bob-width)
(register 'width 'alice-box alice-width)

; Register procedures height
(register 'width 'bob-box bob-height)
(register 'width 'alice-box alice-height)

; Register procedures area
(register 'width 'bob-box bob-area)
(register 'width 'alice-box alice-area)


; Generic procedures
(define (width box)
    ((lookup 'width (type-tag box)) box))

(define (height box)
    ((lookup 'height (type-tag box)) box))

(define (area box)
    ((lookup 'area (type-tag box)) box))


