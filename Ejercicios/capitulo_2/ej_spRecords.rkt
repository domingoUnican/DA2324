#lang racket
(define (assoc key record)
  (if (null? record)
      null
      (if (eq? (car (car record)) key)
          (car record)
          (assoc key (cdr record)))))

(define (add-entry key value record)
  (define (add  key value record)
    (if (null? record)
          null
          (if (eq? (car (car (cdr record))) key)
              (append (car record) (list (list (list key value)) null))
              (append record (add key value null)))))
  (if (null? (assoc key record))
      (if (null? record)
          (list (list key value))
          (append record (add-entry key value null)))
      (if (null? record)
          null
          (if (eq? (car (car (cdr record))) key)
              (append (car record) (list (list key value) null))
              (append record (add key value null))))))

   
(define record '((x 1) (y 2) (z 3) (w 3)))
(assoc 'y record)
(add-entry 'y 4 record) 


