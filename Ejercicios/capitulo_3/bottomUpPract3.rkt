#lang racket

(define (p-act-bottom-up n k)
  (let ((table (make-vector (+ n 1))))
    ;; Inicializar la tabla de vectores
    (do ((i 0 (+ i 1)))
        ((> i n))
      (let ((row (make-vector (+ k 1))))
        (do ((j 0 (+ j 1)))
            ((> j k))
          (if (or (= j 0) (= j 1) (= i 0) (= i 1))
              (vector-set! row j 1)
              (vector-set! row j 0)))
        (vector-set! table i row)))

    ;; Rellenar la tabla con las soluciones de partición
    (do ((i 2 (+ i 1)))
        ((> i n))
      (do ((j 2 (+ j 1)))
          ((> j k))
        (let ((without_j (if (>= (- i j) 0)
                            (vector-ref (vector-ref table (- i j)) j)
                            0)))
          (vector-set! (vector-ref table i) j
                       (+ (vector-ref (vector-ref table i) (- j 1))
                          without_j)))))

    ;; Retornar el resultado
    (vector-ref (vector-ref table n) k)))

(p-act-bottom-up 5 2) ; Sale 3 porque son las particiones de 5 en a lo sumo 2 partes
