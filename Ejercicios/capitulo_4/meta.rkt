#lang racket

; meta.rkt
; The metacircular evaluator from section 4.1
(require rackunit)

(define (seval exp environ)
  ; Evaluate a scheme expression
  (cond ((primitiva? exp) exp)                            ; Primitive just "are". Return back
        ((simbolo? exp) (saca-ambiente exp environ))  ; Symbols? Look up in the environment.
        ((define? exp) (seval-define exp environ)) ; Handle define expressions
        ((if? exp) (seval-if exp environ)) ; Handle if expressions
        ((quote? exp) (seval-quote exp environ)) ; Handle quote expressions
        ((begin? exp) (seval-begin exp environ)) ; Handle begin expressions
        ((lambda? exp) (seval-lambda exp environ)) ; Handle lambda expressions
        ((procedure-application? exp) (seval-procedure-application exp environ)) ; Handle procedure applications
        (else (error "Error desconocido"))
        )
  )

(define (procedure-application? exp)
  (and (list? exp) (not (null? exp))))

(define (evaluacion-funcion? exp)
  (list? exp))

(define (simbolo? exp)
  (symbol? exp))

(define (primitivos? exp)
  (or (number? exp) (boolean? exp)))

(define (nuevo-ambiente)
  (make-hash))

(define ambiente (nuevo-ambiente))

(hash-set! ambiente '+ +)

(hash-set! ambiente '* *)

(hash-set! ambiente '- -)

(hash-set! ambiente '= =)

(hash-set! ambiente '/ /)

(hash-set! ambiente '< <)

(hash-set! ambiente '> >)



(define (anade-ambiente nombre valor ambiente)
  (hash-set! ambiente nombre valor)
  ;(displayln ambiente)
  ambiente)

(define (saca-ambiente nombre ambiente)
  (hash-ref ambiente nombre))

(define (haz-if exp ambiente)
  (let ((lista-sin (cdr exp)))
    (if (seval (car lista-sin) ambiente)
        (seval (car (cdr lista-sin)) ambiente)
        (seval (car (cdr (cdr lista-sin))) ambiente))))

(define (evalua-exp exp ambiente)
  (let ((proc (car exp))
        (args (cdr exp)))
    (apply (seval proc ambiente) (map (lambda (arg) (seval arg ambiente)) args))))

(define (primitiva? exp)
  (or (number? exp) (boolean? exp)))

(define (aplicacion-procedimiento? exp)
  (list? exp))

(define (define? exp)
  (and (list? exp) (eq? (car exp) 'define)))

(define (define-name exp)
  (cadr exp))

(define (define-value exp)
  (caddr exp))

(define (seval-define exp environ)
  (let ((name (define-name exp))
        (value (define-value exp)))
    
    (anade-ambiente name (seval value environ) environ)))

(define (quote? exp)
  (and (list? exp) (eq? (car exp) 'quote)))

(define (quote-expression exp)
  (cadr exp))

(define (seval-quote exp environ)
  (quote-expression exp))

(define (if? exp)
  (and (list? exp) (eq? (car exp) 'if)))

(define (if-test exp)
  (cadr exp))

(define (if-consequence exp)
  (caddr exp))

(define (if-alternative exp)
  (cadddr exp))

(define (seval-if exp environ)
  (if (seval (if-test exp) environ)
      (seval (if-consequence exp) environ)
      (seval (if-alternative exp) environ)))

(define (begin? exp)
  (and (list? exp) (eq? (car exp) 'begin)))

(define (begin-actions exp)
  (cdr exp))

(define (seval-begin exp environ)
  (let ((actions (begin-actions exp)))
    (let loop ((actions actions))
      (cond ((null? actions) '())
            ((null? (cdr actions)) (seval (car actions) environ))
            (else (seval (car actions) environ)
                  (loop (cdr actions)))))))

(define (lambda? exp)
  (and (list? exp) (eq? (car exp) 'lambda)))

(define (lambda-parameters exp)
  (cadr exp))

(define (lambda-body exp)
  (cddr exp))

(define (make-procedure parameters body env)
  (list 'procedure parameters body env))

(define (seval-lambda exp environ)
  (make-procedure (lambda-parameters exp) (lambda-body exp) environ))

(define (procedure? exp)
  (tagged-list? exp 'procedure))

(define (procedure-parameters p)
  (cadr p))

(define (procedure-body p)
  (caddr p))

(define (procedure-environment p)
  ;(displayln p)
  (cadddr p))

(define (seval-procedure-application exp environ)
  (let ((proc (seval (car exp) environ))
        (args (seval-list (cdr exp) environ)))
    (if (list? proc)
    (apply-procedure proc args)
    (apply proc args))))

(define (apply-procedure proc args)
  (let ((env (procedure-environment proc))
        (params (procedure-parameters proc))
        (body (procedure-body proc)))
    (seval-sequence body (extend-environment params args env))))



(define (seval-sequence exps env)
  (cond ((last-exp? exps) (seval (first-exp exps) env))
        (else (seval (first-exp exps) env)
              (seval-sequence (rest-exps exps) env))))

(define (seval-list exps env)
  (if (null? exps)
      '()
      (cons (seval (car exps) env)
            (seval-list (cdr exps) env))))

(define (extend-environment vars vals base-env)
  (if (null? vars)
      base-env  
      (anade-ambiente (car vars) (car vals)
                      (extend-environment (cdr vars) (cdr vals) base-env))))

(define (last-exp? seq)
  (null? (cdr seq)))

(define (first-exp seq)
  (car seq))

(define (rest-exps seq)
  (cdr seq))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      #f))


(define (begin-expressions exp)
  (cdr exp)      
  )

(anade-ambiente 'foo 123 ambiente) ; Se le anade a la variable 'foo el valor 123

;; Varias pruebas para ver que es lo que tiene que ocurrir
(check-equal? (seval '42 ambiente) 42 "Primitives failed")
(check-equal? (seval 'foo ambiente) 123 "Symbol lookup failed")
(seval '(define x 42) ambiente)
(check-equal? (seval 'x ambiente) 42 "Simple define failed")

(seval '(define y (+ 2 3)) ambiente)
(check-equal? (seval 'y ambiente) 5 "Expression define failed")
(check-equal? (seval '(quote x) ambiente) 'x "Quoting failed")


(check-equal? (seval '(if (< 2 3) 1 (/ 1 0)) ambiente) 1 "if-true failed")
(check-equal? (seval '(if (< 3 2) (/ 1 0) 1) ambiente) 1 "if-false failed")
;(display ambiente)

; Procedures
(seval '(define square (lambda (x) (* x x))) ambiente)
;(display ambiente)
(check-equal? (seval '(square 4) ambiente) 16 "square failed")

(seval '(define fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))) ambiente)
(check-equal? (seval '(fact 5) ambiente) 120 "fact failed")


