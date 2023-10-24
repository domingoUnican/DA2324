#lang scheme

; Class: Bob
(define (bob-box x y width height)
  (define (get-width)
    width)
  (define (get-height)
    height)
  (define (get-area)
    (* width height))
  (define (dispatch message)
    (cond ((eq? message 'height) get-height)
          ((eq? message 'width) get-width)
          ((eq? message 'area) get-area)))
  dispatch)


; Class: Alice
(define (alice-box x y x1 y1)
  (define (get-width)
    (- x1 x))
  (define (get-height)
    (- y1 y))
  (define (get-area)
    (* (get-width) (get-height)))
  (define (dispatch message)
    (cond ((eq? message 'height) get-height)
          ((eq? message 'width) get-width)
          ((eq? message 'area) get-area)))
  dispatch)


; Test
(((bob-box 1 2 3 4) 'area))
(((alice-box 1 2 3 4) 'area))
