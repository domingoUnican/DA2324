#lang scheme

(define (add-stream s1 s2)
  (if (or (null? s1) (null? s2))
      '()
      (cons (+ (car s1) (car s2))
            (lambda () (add-stream (cdr s1) (cdr s2)))))
  )

(define (stream-car s)
  (if (null? s)
      (error "stream-car: empty stream")
      (car s))
  )

(define (stream-cdr s)
  (if (null? s)
      (error "stream-cdr: empty stream")
      ((cdr s)))
  )

(define (stream-null? s)
  (null? s)
  )

(define (stream x . rest)
  (cons x (if (null? rest) '() (apply stream rest)))
  )

;; Ejemplo de uso
(define s1 (stream 1 2 3 4 5))
(define s2 (stream 10 20 30 40 50))

(define s3 (add-stream s1 s2))

(stream-car s3) ; Debería devolver 11 (1 + 10)
(stream-car (stream-cdr s3)) ; Debería devolver 22 (2 + 20)


(define s4 (stream 1 2 3))
(define s5 (stream 10 20 30 40))

(define s6 (add-stream s4 s5))

(stream-car s6) ; Debería devolver 11 (1 + 10)
(stream-car (stream-cdr s6)) ; Debería devolver 22 (2 + 20)
(stream-car (stream-cdr (stream-cdr s6))) ; Debería devolver 33 (3 + 30)

(define s7 (stream 1 3 5))
(define s8 (stream 2 4 6))

(define s9 (add-stream s7 s8))

(stream-car s9) ; Debería devolver 3 (1 + 2)
(stream-car (stream-cdr s9)) ; Debería devolver 7 (3 + 4)
(stream-car (stream-cdr (stream-cdr s9))) ; Debería devolver 11 (5 + 6)