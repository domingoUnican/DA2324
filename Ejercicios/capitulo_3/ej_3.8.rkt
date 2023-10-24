#lang racket
(define temp 1)
(define (f x)
  (cond ((= x 1) temp)
        ((= x 0) (set! temp 0) temp)
        ))

; dejando comentada una de las dos funciona bien 
(+ (f 1) (f 0)) ; que devuelva 1
(+ (f 0) (f 1)) ; que devuelva 0
