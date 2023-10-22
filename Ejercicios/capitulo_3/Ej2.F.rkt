#lang racket

;bob box
(define (bob-box x y x1 y1)
  (define (get-width) (- x1 x))
  (define (get-height)(- y1 y))
  (define (get-area)(* (get-width) (get-height)))
  (define (dispatch mensaje)
    (cond ((eq? mensaje 'height) get-height)
          ((eq? mensaje 'width) get-width)
          ((eq? mensaje 'area) get-area)
          )
    )
  dispatch
  )

;alice box
(define (alice-box x y width height)
  (define (get-width) width)
  (define (get-height) height)
  (define (get-area)(* width height))
  (define (dispatch mensaje)
    (cond ((eq? mensaje 'height) get-height)
          ((eq? mensaje 'width) get-width)
          ((eq? mensaje 'area) get-area)
          )
    )
  dispatch
  )
;en ambos casos, lo único que hay que añadir es la forma en la que se hacen las medidas
;despues llamamos al dispatch para que nos devuelve el valor correcto

(define bob (bob-box 1 2 5 7))
(define alice (alice-box 3 4 6 8))

(display "Anchi de bob: ")
(display ((bob 'width)))
(newline)

(display "Altura de Alice: ")
(display ((alice 'height))) 
(newline)

(display "Area de Bob: ")
(display ((bob 'area))) 
(newline)

(display "Ancho de Alice: ")
(display ((alice 'width))) 
(newline)
