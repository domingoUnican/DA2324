#lang racket

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) 
         (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) 
             (=number? m2 0)) 
         0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) 
         (* m1 m2))
        (else (list m1 '* m2))))
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((=number? b 0) 0)
        ((=number? b 1) 1)
        ((and (number? b) (number? e)) (expt b e))
        (else (list b '** e))))

(define (wrap-list lst)
  (if (list? lst) lst (list lst)))

(define (sum? x)
  (and (and (pair? x) (> (length x) 2)) (or (eq? (cadr x) '+) (and (or (eq? (cadr x) '*) (eq? (cadr x) '**)) (sum? (cddr x))))))
(define (addend s)
  (if (eq? (cadr s) '+) (car s) (append (list (car s) (cadr s)) (wrap-list (addend (cddr s))))))
(define (augend s)
  (if (eq? (cadr s) '+) (if (eq? (length s) 3) (caddr s) (cddr s)) (augend (cddr s))))

(define (product? x)
  (and (and (pair? x) (> (length x) 2)) (and (eq? #f (member '+ x)) (or (eq? (cadr x) '*) (and (eq? (cadr x) '**) (product? (cddr x)))))))
(define (multiplier p)
  (if (eq? (cadr p) '*) (car p) (append (list (car p) (cadr p)) (wrap-list (multiplier (cddr p))))))
(define (multiplicand p)
  (if (eq? (cadr p) '*) (if (eq? (length p) 3) (caddr p) (cddr p)) (multiplicand (cddr p))))

(define (exponentiation? x)
  (and (and (pair? x) (> (length x) 2)) (and (and (eq? #f (member '+ x)) (eq? #f (member '* x))) (or (eq? (cadr x) '**) (product? (cddr x))))))
(define (base e) (car e))
(define (exponent e) (caddr e))

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
        ((exponentiation? exp)
         (make-product
          (exponent exp)
          (make-product
           (make-exponentiation
            (base exp)
            (make-sum (exponent exp) (- 1)))
           (deriv (base exp) var))))
        (else (error "unknown expression 
                      type: DERIV" exp))))

; Test 2.58.2
(deriv '(x + 3 * (x + y + 2)) 'x)
; 4