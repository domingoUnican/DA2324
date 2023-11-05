#lang racket
;funciones display y stream
(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

;---------------------------------------------------
(define sum 0) ;sum se inicializa a 0

(define (accum x); accum toma un valor x, lo suma a sum y actualiza sum con el nuevo valor. La función devuelve sum
  (set! sum (+ x sum))
  sum)
;Se crea una secuencia aplicando accum a una secuencia de números del 1 al 20.
;stream-map memoiza sus resultados automáticamente, y los valores de sum se acumulan en seq.
(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20)))

;La secuencia y se crea filtrando los números pares de la secuencia seq quedandose con los pares
(define y (stream-filter even? seq))
;z es otro filtro que se queda con los múltiplos de 5
(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))
;accede a la posicion 7 de y
(stream-ref y 7)
;imprime z
(display-stream z)

;Salida:

;Valor 7 de y
;136

;secuencia de valores de z
;10
;15
;45
;55
;105
;120
;190
;210

;Sin memoización, cada vez que se accede a un elemento de la secuencia seq, la función accum se evaluaría nuevamente,
;y sum se acumularía desde cero en cada llamada. Con memoización, los
;resultados se almacenan y se reutilizan, evitando cálculos repetidos y dando como resultado valores diferentes.
> 