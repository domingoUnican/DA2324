#lang racket

; meta.rkt
; The metacircular evaluator from section 4.1

(define (seval exp environ)
  ; Evaluate a scheme expression
  (cond ((primitiva? exp) exp)                            ; Primitive just "are". Return back
        ((symbol? exp) (recoge exp environ))  ; Symbols? Look up in the environment.
        ((define? exp) (seval-define exp environ))
        ((if? exp) (seval-if exp environ))
        ((quote? exp) (seval-quote exp environ))
        ; ((cond? exp) ...)
        ; ((let ...))
        ; ((delay...))
        ((begin? exp) (begin-expressions exp))
        ((lambda? exp) ???)
        ((aplicacion-procedimiento? exp) (haz-procedimiento exp env))
        (else (error "Error desconocido"))
        )
  )

(define (nuevo-ambiente) (make-hash))
(define (define-in-environment! nombre valor ambiente) (hash-set! ambiente nombre valor))
(define (lookup ambiente llave)
  (if (hash-has-key? ambiente llave)
      (hash-ref ambiente llave)
      (lookup (hash-ref ambiente 'anterior) llave)))
(define ambiente (nuevo-ambiente))

(define (primitiva? exp)
  (or (number? exp) (boolean? exp)))

(define (aplicacion-procedimiento? exp)
  (list? exp)
  )
(define (haz-procedimiento exp env)
  (apply (seval (car exp) env) (map (lambda (x) (seval x env)) (cdr exp))))

; (define name value)

; Predicate to test
(define (define? exp)
  (and (list? exp) (eq? (car exp) 'define))
  )

; Selectors to extract information from the expression
(define (define-name exp)
  (cadr exp)
)

(define (define-value exp)
  (caddr exp)
  )

; Evaluacion
(define (seval-define exp environ)
  (let ((name (define-name exp))
        (value (define-value exp)))
    (define-in-environment! name (seval value environ) environ)
    )
  )



(define (quote? exp)
  (and (list? exp) (eq? (car exp) 'quote)))

(define (quote-expression exp)
  (cadr exp))

; Como evaluar el operador quote

(define (seval-quote exp environ)
  (apply (seval (car exp) env) (map (lambda (x) (seval x env)) (cdr exp))))

; (if test consequence alternative)

(define (if? exp)
  (and (list? exp) (eq? (car exp) 'if)))

; Selectors
(define (if-test exp)
  (cadr exp)
  )

(define (if-consequence exp)
  (caddr exp)
  )

(define (if-alternative exp)
  (cadddr exp)
  )

; como evaluar los if
(define (seval-if exp environ)
  (if (seval (if-test exp) environ)        ;  Evaluate the test first
      (seval (if-consequence exp) environ)
      (seval (if-alternative exp) environ)
      )
  )

; (begin exp1 ... expn)
; Evaluar todas las expresiones

(define (begin? exp)
  (and (list? exp) (eq? (car exp) 'begin))
  )

(define (begin-expressions exp)
  (cdr exp)      ; Note: this returns a *list* of the expressions
  )

; lambda
(define (lambda? exp)
  (and (list? exp) (eq? (car (car exp)) 'lambda))
  )

(define (crear_nuevo_ambiente_funcion nombre_args val_args actual)
  (if (null? nombre_args)
      (begin
        (let ((h (make-hash)))
          (hash-set! h 'anterior actual)
          h))
      (let ((nuevo_ambiente (crear_nuevo_ambiente_funcion (cdr nombre_args) (cdr val_args))))
        (begin
          (hash-set! nuevo_ambiente (car nombre_args) (car val_args))
          nuevo_ambiente
          ))))
(define (guardar-lambda exp environ)) ; aqui hacer define de una funcion con el cuerpo de la exp y crear el ambiente para ella



;; Varias pruebas para ver que es lo que tiene que ocurrir
(check-equal? (seval '42 environ) 42 "Primitives failed")
(check-equal? (seval 'foo environ) 123 "Symbol lookup failed")
(seval '(define x 42) environ)
(check-equal? (seval 'x environ) 42 "Simple define failed")
(seval '(define y (+ 2 3)) environ)
(check-equal? (seval 'y environ) 5 "Expression define failed")
(check-equal? (seval '(quote x) environ) 'x "Quoting failed")

(check-equal? (seval '(if (< 2 3) 1 (/ 1 0)) environ) 1 "if-true failed")
(check-equal? (seval '(if (< 3 2) (/ 1 0) 1) environ) 1 "if-false failed")

; Procedures
(seval '(define square (lambda (x) (* x x))) environ)
(check-equal? (seval '(square 4) environ) 16 "square failed")

(seval '(define fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))) environ)
(check-equal? (seval '(fact 5) environ) 120 "fact failed")



