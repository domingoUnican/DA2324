#lang racket
(define (mcount-pairs x)
  (if (not (mpair? x))
      0
      (+ (mcount-pairs (mcar x))
         (mcount-pairs (mcdr x))
         1)))

(define n1 (mcons 2 null))
(define n2 (mcons n1 n1))
(mcount-pairs n2)


(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs (list 'a 'b 'c)) ; 3

(define x1 '(a)) 
 (define y1 (cons x1 x1)) 
 (define str1 (list y1)) 
 (count-pairs str1) ; 4

(define x2 '(a)) 
 (define y2 (cons x2 x2)) 
 (define str2 (cons y2 y2)) 
 (count-pairs str2) ; 7

(define lst (list 'a 'b 'c)) 
 (set-mcdr! (cddr lst) lst) 
 (count-pairs lst)