#lang racket
(define (alice-make-box x y w h)
      (cons (cons x y) (cons w h)))
(define (alice-height rect)
  (cddr rect))
(define (alice-width rect)
  (car (cdr rect)))
(define (bob-make-box x1 y1 x2 y2)
  (cons (cons x1 y1) (cons x2 y2)))
(define (bob-width rect)
  (- (car (cdr rect)) (car (car rect))))
(define (bob-height rect)
  (- (cdr (cdr rect)) (cdr (car rect))))

(define (poner-etiqueta a x)
  (list a x))

(define a (poner-etiqueta 'alice-make-box (alice-make-box 1 2 3 4)))
(define b (poner-etiqueta 'bob-make-box (bob-make-box 1 2 3 4)))

(define (height rect)
  (cond ((eq? (car rect) 'alice-make-box)
         (alice-height (car (cdr rect))))
        ((eq? (car rect) 'bob-make-box)
         (bob-height (car (cdr rect))))))

(define (width rect)
  (cond ((eq? (car rect) 'alice-make-box)
         (alice-width (car (cdr rect))))
        ((eq? (car rect) 'bob-make-box)
         (bob-width (car (cdr rect))))))

(define (area rect)
  (* (height rect) (width rect)))