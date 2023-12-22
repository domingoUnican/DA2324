#lang racket

; meta.rkt
; The metacircular evaluator from section 4.1

(define (make-env [parent null])
  (cons (make-hash) parent))

(define (get-from-env env key)
  (if (null? env)
      null
      (hash-ref (car env) key (lambda () (get-from-env (cdr env) key)))))

(define (put-in-env env key val)
  (hash-set! (car env) key val))


(define (seval exp [environ (make-env)])
  ; Evaluate a scheme expression
  (cond
    ((primitiva? exp) exp)                               ; ✓ Primitive just "are". Return back
    ((simbolo? exp) (get-from-env environ exp))          ; ✓ Symbols? Look up in the environment.
    ((define? exp) (seval-define exp environ))           ; ✓
    ((if? exp) (seval-if exp environ))                   ; ✓
    ((quote? exp) (seval-quote exp environ))             ; ✓
    ((cond? exp) (seval-cond exp environ))               ; ✓
    ((let? exp) (seval-let exp environ))                 ; ✓
    ((delay? exp) (seval-delay exp environ))             ; ✓
    ((begin? exp) (seval-begin exp environ))             ; ✓
    ((lambda? exp) (seval-lambda exp environ))           ; ✓
    ((application? exp) (seval-application exp environ)) ; ✓
    (else (error "Error desconocido"))))                 ; ✓

(define (primitiva? exp)
  (or (number? exp) (boolean? exp) (string? exp)))

(define (application? exp)
  (list? exp))

(define (application-fun exp)
  (car exp))
(define (application-args exp)
  (cdr exp))

(define (seval-application exp environ)
  (define fun (seval (application-fun exp) environ))
  (define (seval-args args environ)
    (if (empty? args)
        '()
        (cons (seval (car args) environ) (seval-args (cdr args) environ))))
  (define args (seval-args (application-args exp) environ))
  (apply fun args))

(define (lambda? exp)
  (and (list? exp) (eq? (car exp) 'lambda)))
(define (lambda-args exp)
  (cadr exp))
(define (lambda-body exp)
  (caddr exp))

(define (seval-lambda exp environ)
  (define env (make-env environ))
  (define names (lambda-args exp))
  (define body (lambda-body exp))
  (define (fill-lambda-env-with-args env names args)
    (if (not (empty? args))
        (begin
          (put-in-env env (car names) (car args))
          (fill-lambda-env-with-args env (cdr names) (cdr args))) null))
  (lambda args
    (begin
      (fill-lambda-env-with-args env names args)
      (seval body env))))
    

(define (simbolo? exp) (and (not (primitiva? exp)) (not (list? exp))))

; (define name value)

; Predicate to test
(define (define? exp)
  (and (list? exp) (eq? (car exp) 'define)))

; Selectors to extract information from the expression
(define (define-name exp)
  (cadr exp))

(define (define-value exp)
  (caddr exp))

; Definición
(define (seval-define exp environ)
  (put-in-env environ (define-name exp) (seval (define-value exp) environ)))


(define (quote? exp)
  (and (list? exp) (eq? (car exp) 'quote)))

(define (quote-expression exp)
  (cadr exp))

; Como evaluar el operador quote

(define (seval-quote exp environ)
  (quote-expression exp))

; (if test consequence alternative)

(define (if? exp)
  (and (list? exp) (eq? (car exp) 'if)))

; Selectors
(define (if-test exp) (cadr exp))
(define (if-consequence exp) (caddr exp))
(define (if-alternative exp) (cadddr exp))

(define (all proc l)
  (or (empty? l) (and (proc (car l)) (all proc (cdr l)))))
(define (any proc l)
  (and (not (empty? l)) (or (proc l) (any proc (cdr l)))))

(define (first proc l)
  (cond
    ((empty? l) '())
    ((proc (car l)) (car l))
    (else (first proc (cdr l)))))

; Cond
(define (cond? exp) (and (list? exp) (eq? (car exp) 'cond) (all (lambda (e) (list? e)) (cond-exprs exp))))
(define (cond-exprs exp) (cdr exp))
(define (cond-expr-test exp) (car exp))
(define (cond-expr-expr exp) (cadr exp))
(define (seval-cond-expr-test exp environ) (if (eq? exp 'else) #t (seval exp environ)))

(define (seval-cond exp environ)
  (define (seval-cond-exprs exps environ)
    (cond
      ((empty? exps) '())
      ((seval-cond-expr-test (cond-expr-test (car exps)) environ) (seval (cond-expr-expr (car exps)) environ))
      (else (seval-cond-exprs (cdr exps) environ))))
  (seval-cond-exprs (cond-exprs exp) environ))

(define (let? exp) (and (list? exp) (eq? (car exp) 'let)))
(define (let-assignments x) (cadr x))
(define (let-assignment-name x) (car x))
(define (let-assignment-value x) (cadr x))
(define (let-expr x) (caddr x))

(define (seval-let exp environ)
  (define env (make-env environ))
  (define (fill-env-with eval-env env assignments)
    (if (not (empty? assignments))
        (begin
          (put-in-env env (car (car assignments)) (seval (cadr (car assignments)) eval-env))
          (fill-env-with eval-env env (cdr assignments))) null))
  (begin
    (fill-env-with environ env (let-assignments exp))
    (seval (let-expr exp) env)))

(define (delay? exp)
  (and (list? exp) (eq? (car exp) 'delay)))

(define (delay-exp exp) (cadr exp))

(define (seval-delay exp environ)
  (define body (delay-exp exp))
  (delay (seval body environ)))


; como evaluar los if
(define (seval-if exp environ)
  (if (seval (if-test exp) environ)        ;  Evaluate the test first
      (seval (if-consequence exp) environ)
      (seval (if-alternative exp) environ)))

; (begin exp1 ... expn)
; Evaluar todas las expresiones

(define (begin? exp)
  (and (list? exp) (eq? (car exp) 'begin))
  )

(define (begin-expressions exp)
  (cdr exp)      ; Note: this returns a *list* of the expressions
  )

(define (seval-begin exp environ)
  (define (seval-begin-expressions exps environ)
    (if (empty? (cdr exps))
      (seval (car exps) environ)
      (begin
        (seval (car exps) environ)
        (seval-begin-expressions (cdr exps) environ))))
  (seval-begin-expressions (begin-expressions exp) environ))

(define (check-equal? a b msg)
  (cond
    ((not (eq? a b)) (display msg) (newline))))

(define environ (make-env))
(define (add-built-ins-to-env env)
  (put-in-env env '+ +)
  (put-in-env env '- -)
  (put-in-env env '* *)
  (put-in-env env '/ /)
  (put-in-env env '= =)
  (put-in-env env '< <)
  (put-in-env env '> >)
  (put-in-env env '<= <=)
  (put-in-env env '>= >=)
  (put-in-env env 'eq? eq?)
  (put-in-env env 'display display)
  (put-in-env env 'newline newline)
  (put-in-env env 'cons cons)
  (put-in-env env 'car car)
  (put-in-env env 'cdr cdr)
  (put-in-env env 'foo 123)
)

(add-built-ins-to-env environ)

;; Varias pruebas para ver que es lo que tiene que ocurrir
(check-equal? (seval '42 environ) 42 "Primitives failed")
(check-equal? (seval 'foo environ) 123 "Symbol lookup failed")
(check-equal? (seval '"string" environ) "string" "String primitive failed")
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

; Cond
(check-equal? (seval '(cond ((= foo 0) 0) ((= foo 123) 1) (else 2)) environ) 1 "cond failed")

; Let
(check-equal? (seval '(let ([x 2] [y 3]) (+ x y)) environ) 5 "let failed")
(check-equal? (seval '(+ x y) environ) 47 "let polluted the environ")

; Delay
(check-equal? (force (seval '(delay 42) environ)) 42 "delay failed")

; Begin
(check-equal? (seval '(begin (display "✓ Begin can use `display`") (newline) 42) environ) 42 "begin failed")

(display "✓ Tests done") (newline)

