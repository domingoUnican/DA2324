#lang scheme

(define (rectangulo-domingo x y anchura altura)
  (define (get-anchura)
    anchura)
  (define (get-altura)
    altura)
  (define (get-area)
    (* anchura altura))
  (define (dispatch mensaje)
    (cond ((eq? mensaje 'altura) get-altura)
          ((eq? mensaje 'anchura) get-anchura)
          ((eq? mensaje 'area) get-area)))
  dispatch)


(((rectangulo-domingo 1 2 3 4) 'altura))
