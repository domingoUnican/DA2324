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




