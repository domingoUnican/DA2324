#lang racket
(define (enumerate-interval start stop)
    (if (> start stop)
        empty-stream
        (stream-cons start 
                     (enumerate-interval (+ start 1) stop))))

(define (stream-map proc s)
    (if (stream-empty? s) 
        empty-stream
        (stream-cons (proc (stream-first s))
                     (stream-map proc (stream-rest s)))))

(define (stream-sum s)
    (if (stream-empty? s)
        0
	(+ (stream-first s) (stream-sum (stream-rest s)))))

(define (display-stream s)
     (if (stream-empty? s) null
         (begin (display (stream-first s))
                (newline)
                (display-stream (stream-rest s)))))


(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq 
  (stream-map 
   accum 
   (enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))

sum
(stream-ref seq 0)
sum
(stream-ref seq 0)
sum

;stream-ref te devuelve el elemento 7 del stream
(stream-ref y 7)
;te muestra los valores de todo el stream
(display-stream z)

; Los valores de seq solo se evaluan una vez cada uno, es por eso que no vuelve
; a ejecutar las operaciones. Si lo hicieramos con un lambda y delay no daría
; lo mismo porque vuelve a ejecutar la operacion y eso modifica el valor sum, en cambio
; con la memoizacion se guarda el resultado.



