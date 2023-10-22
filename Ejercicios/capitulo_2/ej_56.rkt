#lang scheme

;funcion exponentiation? para verificar si una expresión es una exp
(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

;extrae la base
(define (base exp)
  (cadr exp))

;extrae el exponente
(define (exponent exp)
  (caddr exp))

;ahora basta con anhadir a make-sum y make-product el nuevo caso a manejar
(define (make-sum . terms)
  (define (add-terms terms)
    (cond ((null? terms) 0)
          ((= (length terms) 1) (car terms))
          (else (list '+ (car terms) (add-terms (cdr terms))))))
  (add-terms terms))


(define (make-product . factors)
  (define (multiply-factors factors)
    (cond ((null? factors) 1)
          ((= (length factors) 1) (car factors))
          (else (list '* (car factors) (multiply-factors (cdr factors))))))
  (multiply-factors factors))


(define (make-exponentiation base exponent)
  (if (number? exponent 0)
      1
      (if (number? exponent 1)
          base
          (list '** base exponent))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

; Función para derivar una expresión con respecto a una variable
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        (else (error "unknown expression 
                      type: DERIV" exp))))

; Ejemplos
(deriv '(+ x y (+ x 3)) 'x)

(deriv '(* x y) 'x)

(deriv '(* (* x y) (+ x 3)) 'x)