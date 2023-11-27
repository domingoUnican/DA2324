#lang scheme

; Naive algorithm
(define (p n)
  (p_act n n))

(define (p_act n k)
  (cond ((and (eq? n k) (eq? n 0)) 1))
  (if (and (>= n 0) (>= k 1))
      (if (or (eq? n 0) (eq? k 1))
          1
          (if (> k n)
              (p_act n n)
              (+ (p_act n (- k 1)) (p_act (- n k) k))))
      0))

(p_act 100 10) ; Expected: 6292069



; Top down
(define table-top (make-hash))

(define (p_top n)
  (p_act_top n n))

(define (p_act_top n k)
  (cond ((and (eq? n k) (eq? n 0)) 1))
  (if (and (>= n 0) (>= k 1))
      (if (or (eq? n 0) (eq? k 1))
          1
          (if (> k n)
              (hash-ref! table-top '(n n) (lambda () (p_act_top n n)))
              (hash-ref! table-top '(n k) (lambda () (+ (p_act_top n (- k 1)) (p_act_top (- n k) k))))))
      0))

(p_act 100 10) ; Expected: 6292069