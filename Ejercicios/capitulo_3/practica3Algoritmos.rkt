#lang racket
(define (p n)
  "Calcula el numero total de particiones"
  (p-act n n))

(define (p-act n k)
  "Calcula el numero de particiones con k sumandos a lo mucho"
  (cond
    ((and (= n 0) (= k 0)) 1)
    ((and (>= n 0) (>= k 1)) (+ (p-act n (- k 1)) (p-act (- n k) k)))
    (else 0)))

(define (p-act2 n k)
  (cond
    ((and (= n 0) (= k 0)) 1)
    ((and (>= n 0) (>= k 1))
      (cond
        ((or (= n 0) (= k 1)) 1)
        ((> k n) (p-act2 n n))
        (else (+ (p-act2 n (- k 1)) (p-act2 (- n k) k))))
      )
    (else 0)))

;Complejidad temporal:O(2^k)
;Complejidad espacial:O(k)

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

(p-act-bottom-up 5 2)


