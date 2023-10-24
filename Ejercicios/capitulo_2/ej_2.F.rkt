#lang racket

;alice box
(define (alice-box x y width height)
  (define (get-width)
    width)
  (define (get-height)
    height)
  (define (get-area)
    (* width height))
  (define (dispatch mensaje)
    (cond ((eq? mensaje 'height) get-height)
          ((eq? mensaje 'width) get-width)
          ((eq? mensaje 'area) get-area)
          )
    )
  dispatch
  )

;bob box
(define (bob-box x y x1 y1)
  (define (get-width)
    (- x1 x))
  (define (get-height)
    (- y1 y))
  (define (get-area)
    (* (get-width) (get-height)))
  (define (dispatch mensaje)
    (cond ((eq? mensaje 'height) get-height)
          ((eq? mensaje 'width) get-width)
          ((eq? mensaje 'area) get-area)
          )
    )
  dispatch
  )

;comprobamos que los antiguos funcionan
(((bob-box 1 2 3 4) 'width))
(((alice-box 1 2 2 2) 'width))

(((bob-box 1 2 3 4) 'height))
(((alice-box 1 2 2 2) 'height))

(((bob-box 1 2 3 4) 'area))
(((alice-box 1 2 2 2) 'area))


