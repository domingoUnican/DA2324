#lang scheme

; Super class Box
(define (width box)
  (cond ((eq? (car box) 'bob-make-box)
        (bob-width (cdr box)))
       ((eq? (car box) 'alice-make-box)
        (alice-width (cdr box)))))

(define (height box)
  (cond ((eq? (car box) 'bob-make-box)
        (bob-height (cdr box)))
       ((eq? (car box) 'alice-make-box)
        (alice-width (cdr box)))))

(define (box-area box)
  (cond ((eq? (car box) 'bob-make-box)
        (bob-area box))
       ((eq? (car box) 'alice-make-box)
        (alice-area box))))


; Bob's box 
(define (bob-make-box x y w h)
  (cons (cons x y) (cons w h)))

(define (bob-width box)
   (car (cdr box)))

(define (bob-height box)
   (cdr (cdr box)))

(define (bob-area box)
    (* (width box) (height box)))

; Alice's box
(define (alice-make-box x1 y1 x2 y2)
 (cons (cons x1 y1) (cons x2 y2)))

(define (alice-width box)
   (abs (- (car (cdr box))
           (car (car box)))))

(define (alice-height box)
   (abs (- (cdr (cdr box))
           (cdr (car box)))))

(define (alice-area box)
    (* (width box) (height box)))

; Tags
(define (attach-tag tag contents) (cons tag contents))
(define (type-tag datum) (car datum))
(define (contents datum) (cdr datum))


; Test
(define a (alice-make-box 1 2 3 4))
(define b (bob-make-box 1 2 3 4))
(box-area (attach-tag 'alice-make-box a))
(box-area (attach-tag 'bob-make-box b))


