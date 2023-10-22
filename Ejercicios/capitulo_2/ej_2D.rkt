#lang scheme

; Creación de un registro usando tabla hash
(define registry (make-hash))

; Función para registrar procedimientos en el registro
(define (register name tag proc)
   (hash-set! registry (list name tag) proc))

; Funciones para calcular el ancho, alto y área de 'bob-box'
(define (bob-width box)
  5)

(define (bob-height box)
  3)

(define (bob-area box)
  (* (bob-width box) (bob-height box)))

; Funciones para calcular el ancho, alto y área de 'alice-box'
(define (alice-width box)
  4)

(define (alice-height box)
  2)

(define (alice-area box)
  (* (alice-width box) (alice-height box)))

; Registra las funciones para 'bob-box'
(register 'width 'bob-box bob-width)
(register 'height 'bob-box bob-height)
(register 'area 'bob-box bob-area)

; Registra las funciones para 'alice-box'
(register 'width 'alice-box alice-width)
(register 'height 'alice-box alice-height)
(register 'area 'alice-box alice-area)

; Función para obtener el tipo de un objeto
(define (type-tag box)
   (car box))

; Función para buscar procedimientos en el registro
(define (lookup name tag)
   (hash-ref registry (list name tag) #f))

; Función para calcular el ancho de cualquier objeto
(define (width box)
   ((lookup 'width (type-tag box)) box))

; Función para calcular el alto de cualquier objeto
(define (height box)
   ((lookup 'height (type-tag box)) box))

; Función para calcular el área de cualquier objeto
(define (area box)
   ((lookup 'area (type-tag box)) box))

; Ejemplos de uso de las funciones para calcular el ancho, alto y área
(display "Ancho de bob-box: ")
(display (width '(bob-box)))
(newline)

(display "Alto de alice-box: ")
(display (height '(alice-box)))
(newline)

(display "Área de bob-box: ")
(display (area '(bob-box)))
(newline)
