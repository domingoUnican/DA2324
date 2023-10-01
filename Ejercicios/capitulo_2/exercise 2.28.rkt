#lang racket
(define arbol 
  (list (list 1 2) (list 3 4)))
(define nil '())

(define (fringe x)
  (if (null? x)
      nil ;si no es un arbol se devuelve una lista vacia
      (let ((hoja (car x))) ;se define hoja como la primera rama del arbol
        (if (not (pair? hoja)) ;se evalua si la hoja es una lista o es un numero
            (cons hoja (fringe (cdr x))) ;si es un numero se crea una lista con ese numero y la recursion de la funcion del resto del arbol
            (append (fringe hoja) (fringe(cdr x)));si es una lista se crea una lista con la funcion recursiva de la supuesta hoja y la funcion recursiva de lo que queda del arbol
            )
        )
      )
  )

(fringe arbol) ;prueba que deveria de devolver (1 2 3 4)