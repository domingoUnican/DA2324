#lang scheme

; Rectangulos
(define (rectangulo x y w h)
  (cons (cons x y) (cons w h)))

(define (height-rect r)
  (cdr (cdr r)))

(define (rectangulo-companero x y x1 y1)
  (cons (cons x y) (cons x1 y1)))

(define (width-companero rect)
  (- (car (cdr rect)) (car (car rect))))

(define (height-companero rect)
  (- (cdr (cdr rect)) (cdr (car rect))))

(define (poner-etiqueta a x)
  (list a x))

(define (height rect)
  (cond ((eq? (car rect) 'rectangulo)
         (height-rect (car (cdr rect))))
        ((eq? (car rect) 'rectangulo-companero)
         (height-companero (car (cdr rect))))))

  
(width-companero (rectangulo-companero 4 3 8 20))