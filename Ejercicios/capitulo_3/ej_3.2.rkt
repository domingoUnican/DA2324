#lang racket
(define (make-monitored f)
  
  (define (make-monitored-t f count)
    (define (how-many-calls?)
      count)
    (define (func a)
      (set! count (+ count 1))
      (f a)
      )
    (define (dispatch mensaje)
      (cond ((eq? mensaje 'how-many-calls?) (how-many-calls?))
            ((number? mensaje) (func mensaje))))
    dispatch 
   )
  (make-monitored-t f 0)
)


(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)