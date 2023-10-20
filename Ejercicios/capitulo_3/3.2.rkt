#lang racket
(define (make-monitored x)
  (define times-called 0)
  (define (mf message)
  (cond ((eq? message 'how-many-calls?) times-called)
        ((eq? message 'reset-count) (set! times-called 0))
        (else (set! times-called (+ times-called 1))
              (x message))))
   mf)
        

(define s (make-monitored sqrt))

(define (add x)
  (+ x x))
(define a (make-monitored add))

(a 5)
;10
(a 'how-many-calls?)
;1
(s 100)
;10
(s 64)
;8

(s 'how-many-calls?)
;2

(s 'reset-count)
(s 'how-many-calls?)
;0