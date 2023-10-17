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
        (if (eq? (car (car record)) key)
            (if (null? (cdr record))
                (append (list (list key value)) null)
                (append (list (list key value)) (cdr record)))
            (if (null? (cdr record))
                record
                (append (list (car record)) (add key value (cdr record)))))))
  (if (null? (assoc key record))
      (if (null? record)
          (list (list key value))
          (append record (add-entry key value null)))
      (if (null? record)
        null
        (if (eq? (car (car record)) key)
            (if (null? (cdr record))
                (append (list (list key value)) null)
                (append (list (list key value)) (cdr record)))
            (if (null? (cdr record))
                record
                (append (list (car record)) (add key value (cdr record))))))))

(define (del-entry key record)
  (if (eq? (car (car record)) key)
      (cdr record)
      (append (list (car record)) (del-entry key (cdr record)))))



   
(define record '((x 1) (y 2) (z 3) (w 3)))
(assoc 'y record)
(add-entry 'b 4 record)
(add-entry 'a 4 record)
(add-entry 'w 4 record)
(add-entry 'z 4 record)
(add-entry 'x 4 record)
(del-entry 'x record)
(del-entry 'z record)
(del-entry 'w record)


