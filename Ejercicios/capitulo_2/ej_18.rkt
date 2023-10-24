#lang scheme

; Reverse list
(define (reverse list)
  (if (null? (cdr list))
      list
     (append (reverse (cdr list)) (cons (car list) null))))


(reverse '(1 2 3 4))