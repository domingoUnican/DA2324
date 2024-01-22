#lang scheme

; ------------------- 1 -------------------------
; PUNTO
(define (crea-punto x y)
  (cons x y))

(define (dist-puntos p1 p2)
  (sqrt (+ (expt (- (car p1) (car p2)) 2) (expt (- (cdr p1) (cdr p2)) 2))))


; TRIANGULO
(define (crea-triangulo punto1 punto2 punto3)

  (define (calcula-perimetro)
    (+ (+ (dist-puntos p1 p2) (dist-puntos p2 p3)) (dist-puntos p3 p1)))
  
  (define (dispatch message)
    (cond ((eq? message 'perimetro) calcula-perimetro)))
    
  dispatch)


; TEST
(define p1 (crea-punto 0 0))
(define p2 (crea-punto 1 0))
(define p3 (crea-punto 0 1))
(((crea-triangulo p1 p2 p3) 'perimetro))




; ------------------- 2 -------------------------

; Sumatorio iterativo
(define (suma-iguales-iter x . y)
  (if (even? x)
      (sumatorio-iter y even? x)
      (sumatorio-iter y odd? x)))

(define (sumatorio-iter lista paridad suma)
  (if (not (null? lista))
      (cond
        ((paridad (car lista)) (sumatorio-iter (cdr lista) paridad (+ suma (car lista))))
        ((eq? 1 1) (sumatorio-iter (cdr lista) paridad suma)))
      suma))

; Sumatorio recursivo
(define (suma-iguales-rec x . y)
  (if (even? x)
      (+ x (sumatorio-rec y even?))
      (+ x (sumatorio-rec y odd?))))

(define (sumatorio-rec lista paridad)
  (if (not (null? lista))
      (cond
        ((paridad (car lista)) (+ (car lista) (sumatorio-rec (cdr lista) paridad)))
        ((eq? 1 1) (sumatorio-rec (cdr lista) paridad)))
      0))

(suma-iguales-iter 10 5 6 5 3)
(suma-iguales-iter 1 5 6 5 3)
(suma-iguales-rec 10 5 6 5 3)
(suma-iguales-rec 1 5 6 5 3)





; ------------------- 3 -------------------------

; DO WHILE
(define (do-while proc lista condicion)
  (if (not (null? lista))
      (begin
        (proc (car lista))
        (cond
          ((eq? #t (condicion (car lista))) (do-while proc (cdr lista) condicion)))
        )
      (display "La lista está vacía")))


(do-while (lambda (x) (newline) (display x)) (list 57 321 88 10 80) (lambda (x) (> x 30)))



; ------------------- 4 -------------------------

(define (make-queue)
  (let ((front-ptr ...)
        (rear-ptr ...))

        
    )

  (define (dispatch message)
       ;(cond ((eq? message 'perimetro) calcula-perimetro)))

    
  dispatch)










