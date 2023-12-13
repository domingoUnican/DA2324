#lang racket

(require racket/stream)


(define (stream-ref s n)
  ; (newline) (display "stream-ref ") (display s) (display " ") (display n)
  (if (= n 0)
      (stream-first s)
      (stream-ref (stream-rest s) (- n 1))))

(define (stream-map proc s)
  (if (stream-empty? s)
      empty-stream
      (stream-cons
       (proc (stream-first s))
       (stream-map proc (stream-rest s)))))

(define (stream-for-each proc s)
  (if (stream-empty? s)
      'done
      (begin 
        (proc (stream-first s))
        (stream-for-each proc 
                         (stream-rest s)))))


(define (stream-enumerate-interval low high)
  (if (> low high)
      empty-stream
      (stream-cons
       low
       (stream-enumerate-interval (+ low 1)
                                  high))))

(define (integers-from n)
  ; (newline) (display "Generating integer ") (display n)
  (stream-cons
    n
    (integers-from (+ n 1))))

(define integers (integers-from 1))

; Versión no memoizada
(define (p_act n k)
  (cond
    ((> k n) (p_act n n))
    ((<= n 1) 1)
    ((= k 1) 1)
    (else (+ (p_act n (- k 1)) (p_act (- n k) k)))))

; Versión bottom-up, aprovechando que los streams son automáticamente memoizados
(define (p_act_stream_n n)
  (define (p_act_stream_n_k n k)
    ; (display "Computing p_act_stream ") (display n) (display " ") (display k) (newline) 
    (stream-cons
      (cond
        ((= k 1) 1)
        ((> k n) (stream-ref (stream-ref p_act_stream (- n 1)) (- n 1)))
        (else (+ (stream-ref (stream-ref p_act_stream (- n 1)) (- k 2)) (if (> n k) (stream-ref (stream-ref p_act_stream (- (- n k) 1)) (- k 1)) 1))))
      (p_act_stream_n_k n (+ k 1))))
  ; (display "Computing p_act_stream ") (display n) (newline) 
  (stream-cons
    (p_act_stream_n_k n 1)
    (p_act_stream_n (+ n 1))))

(define p_act_stream (p_act_stream_n 1))

(define (p_bottom_up n)
  ; (display "Getting (p_bottom_up ") (display n) (display ")") (newline)
  (stream-ref (stream-ref p_act_stream (- n 1)) (- n 1)))

(define (p n) (p_act n n))

(newline)
(p 1)
(p 2)
(p 3)
(p 4)
(p 5)
(p 6)

(newline)
(p_bottom_up 1)
(p_bottom_up 2)
(p_bottom_up 3)
(p_bottom_up 4)
(p_bottom_up 5)
(p_bottom_up 6)