#lang scheme

; Square
(define (square x)
  (* x x))

; Wrong iterative Square-list
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(square-list '(1 2 3 4)) ; Answer is reversed

;The order here goes as follows:
; (iter (1 2 3 4) null)
; (iter (2 3 4) (1^2))
; (iter (3 4) (2^2 1^2))
; (iter (4) (3^2 2^2 1^2))
; (iter null (4^2 3^2 2^2 1^2))
; (4^2 3^2 2^2 1^2)
; We can deduce that the problem is the order in which the result of each iteration
; is appended to the answer list. Each result should be added at the end of the list,
; not at the begining




; Wrong iterative Square-list (again)
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items null))

(square-list2 '(1 2 3 4)) ; Answer is ordered but not well-represented

; The problem here is different. Although the order of the values is correct
; the list concatenation is not.



; A possible solution would be:
(define (square-list3 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list(square 
                     (car things)))))))
  (iter items null))

(square-list3 '(1 2 3 4)) ; Answer is correct


