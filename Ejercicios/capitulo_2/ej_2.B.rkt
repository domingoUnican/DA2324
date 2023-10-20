#lang racket
; Bob's box
(define (bob-make-box x y w h)
  (poner-etiqueta 'bob (cons (cons x y) (cons w h))))

(define (bob-width box)
   (car (cdr (car (cdr box)))))

(define (bob-height box)
   (cdr (cdr (car (cdr box)))))

(define (bob-area box)
    (* (bob-width box) (bob-height box)))

; Alice's box
(define (alice-make-box x1 y1 x2 y2)
 (poner-etiqueta 'alice (cons (cons x1 y1) (cons x2 y2))))

(define (alice-width box)
   (abs (- (car (cdr (car (cdr box))))
           (car (car (car (cdr box)))))))

(define (alice-height box)
   (abs (- (cdr (cdr (car (cdr box))))
           (cdr (car (car (cdr box)))))))

(define (alice-area box)
    (* (alice-width box) (alice-height box)))


(define (poner-etiqueta a x)
  (list a x))
  
;comprobamos que los antiguos funcionan
(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))
  
(alice-area a) ;4
(bob-area b) ;12

