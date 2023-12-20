#lang racket
;EJERCICIO 1

;definimos un triangulo de 3 puntos, con sus coordenadas x y
;cada punto es un par x y
(define (crea-triangulo x1 y1 x2 y2 x3 y3)
  (list (cons x1 y1) (cons x2 y2) (cons x3 y3)))

;el punto1 es el primer elemento car
(define (punto1 triangulo)
  (car triangulo))
;el punto2 es el segundo elemento car cdr
(define (punto2 triangulo)
  (cadr triangulo))
;el punto 3 es el tercer elemento car cdr cdr
(define (punto3 triangulo)
  (caddr triangulo))

;funcion que calcula la distancia entre dos puntos h = sqrt(x2-x1)^2 + (y2 - y1)^2)
(define (distancia punto1 punto2)
  (sqrt (+ (sqr (- (car punto2) (car punto1))) (sqr (- (cdr punto2) (cdr punto1))))))

;funcion que calcula el perimetro del triangulo, usando la funcion distancia y pasando cada puntos como argumento
(define (perimetro triangulo)
  (+ (distancia (punto1 triangulo) (punto2 triangulo))
     (distancia (punto2 triangulo) (punto3 triangulo))
     (distancia (punto3 triangulo) (punto1 triangulo))))

;definimos un ejemplo
(define triangulo (crea-triangulo 0 1 1 0 0 0))
(display "El perímetro del trangulo es: ")
(display(perimetro triangulo))

;/////////////////////////////////////////////////////////////////////
;EJERCICIO 2
(define (cardinalidad numero)
  (if (even? numero)
      0
      1))

(define (suma-iguales-iter lista)
  (let ((cardinalidad-primer-elemento (cardinalidad (car lista))))

    (define (aux lista suma)
      (if (null? lista)
          suma
          (if (= (cardinalidad (car lista)) cardinalidad-primer-elemento)
              (aux (cdr lista) (+ suma (car lista)))
              (aux (cdr lista) suma))))
    (aux lista 0)))

(define (suma-iguales-rec lista)
  (let ((cardinalidad-primer-elemento (cardinalidad (car lista))))
    (define (aux lista)
      (cond ((null? lista) 0)
            ((= (cardinalidad (car lista)) cardinalidad-primer-elemento)
             (+ (car lista) (aux (cdr lista))))
            (else (aux (cdr lista)))))
    (aux lista)))


;crear una lista de numeros
(newline)
(display (suma-iguales-iter (list 1 2 3 4 5 6 7 8 9 10 11)))

(newline)
(display (suma-iguales-rec (list 1 2 3 4 5 6 7 8 9 10 11)))
;/////////////////////////////////////////////////////////////////////