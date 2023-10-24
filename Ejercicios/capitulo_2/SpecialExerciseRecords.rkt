#lang racket

(define (assoc key record)
  (cond ((null? record) null)                  
        ((equal? key (car (car record))) (car record)) 
        (else (assoc key (cdr record)))))


(define record '((x 1) (y 2) (z 3)))
(assoc 'y record)

;(define (add-entry key value record)
  ;(if ((null? record) (append (list (list record (key value))))                  
   ;else (key (car (car record))) (cons (car (car record)) value))))


;(add-entry 'w 4 record) 
;(add-entry 'x 10 record) 