#lang racket
;Aqui iria el codigo 2B 2C 2D
(define (make-alice x y width height)
  (define (dispatch message)
    (cond ((eq? message 'width) width)
          ((eq? message 'height) height)
          ((eq? message 'type) 'alice)
          (else (error "Unknown message:" message)))
    )
  dispatch
)

(define (make-bob x y width height)
  (define (dispatch message)
    (cond ((eq? message 'width) width)
          ((eq? message 'height) height)
          ((eq? message 'type) 'bob)
          (else (error "Unknown message:" message)))
    )
  dispatch
)