#lang racket
 (define (make-monitored funcion) ;toma como argumento una funcion
   (define num-llamadas 0); Definimos una variable num-llamdas e inicializa su valor en 0. Es un registro del numero de llamdas a guncion
   (define (mf message) ;mf es una funcion que toma como argumento un mensaje, se devuelve y se utilizará para realizar un seguimiento del número de llamadas a
     ;la funcion
     (cond ((eq? message 'how-many-calls?) num-llamadas) ;si el mensaje recibido es el simbolo especial 'how-many-calls?, retornamos el numero de llamadas
           ((eq? message 'reset-count) (set! num-llamadas 0)); si es el simbolo especial reset-count, mf pone el valor de llamadas a 0
           (else (set! num-llamadas (+ num-llamadas 1)) ;para otro valor, incrementa el valor de la llamada y devuelve el valor de la variable
                 (funcion message)))) 
   mf)

(define s (make-monitored sqrt))

(s 100)


(s 'how-many-calls?)
