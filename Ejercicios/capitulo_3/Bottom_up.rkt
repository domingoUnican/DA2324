#lang racket

 (define h (make-hash));La tabla esta vacia
(define i 5)
(display i)
(hash-ref h (list 1 2) "No esta")
(hash-set! h (list 1 2) 1);Aqui asignamos (1,2) -> 1
(hash-ref h(list 1 2) "No esta")

(hash-set! h (list 1 2) 2)
(hash-ref h(list 1 2) "No esta")





