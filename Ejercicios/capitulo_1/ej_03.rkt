#lang scheme

; Suma de los cubos de los dos mayores números
(define (func x y z)
    (if (> x y)
        (if (> y z)
            (+ (* x x) (* y y))
            (+ (* x x) (* z z)))
        (if (> x z)
            (+ (* x x) (* y y))
            (+ (* z z) (* y y)))
    )
)

(print (func 1 2 3))