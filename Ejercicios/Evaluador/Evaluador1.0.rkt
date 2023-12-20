#lang racket
(define (seval exp env)
  (cond ((primitivos? exp) exp)
        ((simbolo? exp) (saca-ambiente exp env))
        ((es-define? exp) (haz-define exp env))
        ((es-if? exp) (haz-if exp env))
         ((es-cond? exp) (haz-cond exp env))
        ((evaluacion-funcion? exp) (evalua-exp exp env))
        (else (error "No reconocido"))))

;;Evaluacion procedimiento
(define (evaluacion-funcion? exp)
  (list? exp))
;;Es simbolo?
(define (simbolo? exp)
  (symbol? exp))
;;es if?
(define (es-if? exp)
  (and (list? exp) (eq? (car exp) 'if)))
;;es primitivo
(define (primitivos? exp)
  (or (number? exp) (boolean? exp)))
;;es define?
(define(es-define? exp)
  (and (list? exp) (eq? (car exp) 'define)))
;;es cond?
(define (es-cond? exp)
  (and (list? exp)(eq? (car exp) 'cond)))
;;es begin?
(define (es-begin? exp)
  (and (list? exp) (eq? (car exp) 'begin)))
;;es quote?
;;(define (es-quote? exp)
;;  (and (list? exp) (eq? (car exp) 'quote)))


;funciones de ambiente
(define (nuevo-ambiente) (make-hash))
(define ambiente (nuevo-ambiente))
(define (anade-ambiente nombre valor ambiente)
  (hash-set! ambiente nombre valor))
(define (saca-ambiente nombre ambiente)
  (hash-ref ambiente nombre))

;Hace la funcion if
(define (haz-if exp ambiente)
  (let ((lista-sin (cdr exp))
        )
    (if (seval (car lista-sin) ambiente)
        (seval (car (cdr lista-sin)) ambiente)
        (seval (car (cdr (cdr lista-sin))) ambiente))))

;Evalua la expresion
(define (evalua-exp exp ambiente)
  (let ((proc (car exp))
       (args (cdr exp)) )
    (apply (seval proc ambiente) (map (lambda (arg) (seval arg ambiente)) args))))


;el define es de esta forma
(define (haz-define exp env)
  (let ((variable (cadr exp))
        (valor-exp (caddr exp)))
    (anade-ambiente variable (seval valor-exp env) env)))

;hace el cond
(define (haz-cond exp ambiente)
  ;; Extrae las cláusulas del condicional
  (let ((clausulas (cdr exp)))
    ;; Verifica si no hay cláusulas y lanza un error en ese caso
    (cond ((null? clausulas) (error "cond sin cláusulas"))
          ;; Si la condición de la primera cláusula es verdadera,
          ;; evalúa y retorna la expresión asociada
          ((seval (car (car clausulas)) ambiente)
           (seval (cadr (car clausulas)) ambiente))
          ;; Si ninguna de las anteriores condiciones se cumple,
          ;; realiza una llamada recursiva a haz-cond con el resto de las cláusulas
          (else (haz-cond (cons 'cond (cdr clausulas)) ambiente)))))

(seval '42 ambiente)
(anade-ambiente 'x 13 ambiente)
(anade-ambiente 'true true ambiente)
(anade-ambiente '+ + ambiente)
(anade-ambiente '< < ambiente)
(anade-ambiente '* * ambiente)
(anade-ambiente '= = ambiente)
(anade-ambiente '> > ambiente)



(seval '(* ( + 1 2) (+ 1 (+ 3 2))) ambiente)
(seval '(if (< x 12) (+ x 1) 1) ambiente)
(seval '(define z 2)ambiente)
(seval 'z ambiente)

; Ejemplo es define

(haz-define '(define x (* 2 20)) ambiente)
(seval 'x ambiente)

;ejemplo cond

(anade-ambiente 'x 10 ambiente)
(seval '(cond ((< x 10) 9)
              ((= x 10) 10)
              ((> x 10) 15)
              (else true))
       ambiente)