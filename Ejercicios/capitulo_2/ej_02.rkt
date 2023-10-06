#lang scheme

; Returns the initial and final point pair
; u, v: points
(define (make-segment u v)
  (cons u v))

; Returns the initial point
; s: segment
(define (start-segment s)
  (car s))

; Returns the final point
; s: segment
(define (end-segment s)
  (cdr s))

; Returns a point with coordinates (x, y)
; x, y: coordinates
(define (make-point x y)
  (cons x y))

; Returns the x coordinate
; x: number
(define (x-point p)
  (car p))

; Returns the y coordiante
; y: number
(define (y-point p)
  (cdr p))

; Midpoint segment
; s: segment
(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))


; Prints point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


; Test
(print-point (midpoint-segment (make-segment (make-point 12 13) (make-point 26 15))))