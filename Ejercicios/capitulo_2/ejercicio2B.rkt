#lang racket

; Type-tagging procedures
(define (attach-tag tag contents)
  (cons tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: 
              TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: 
              CONTENTS" datum)))
; Alice's code
(define (alice-make-box x y w h)
  (attach-tag 'alice-box
               (cons (cons x y) (cons w h))))

(define (alice-area box)
  (* (- (car (cdr (contents box))) (car (car (contents box))))
     (- (cdr (cdr (contents box))) (cdr (car (contents box))))))
  


; Bob's code
(define (bob-make-box x y w h)
  (attach-tag 'bob-box
               (cons (cons x y) (cons w h))))

(define (bob-box? b)
  (eq? (type-tag b) 'bob-box))

(define (bob-area b)
  (* (car (cdr (contents b))) (cdr (cdr (contents b)))))

(define (bob-width b)
  (car (cdr (contents b))))

(define (bob-height b)
  (cdr (cdr (contents b))))

(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))

(alice-area a)

(bob-area b)

a
b