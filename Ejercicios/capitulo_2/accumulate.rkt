#lang scheme
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                     initial
                     (cdr sequence)))))

(define (suma-lista l)
  (accumulate + 0 l))

(define (length l)
  (accumulate (lambda (x y) (+ 1 y)) 0 l))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
             null sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (reduce procedure sequence)
  (accumulate procedure (car sequence) (cdr sequence)))


initial = 1
for element in range array:
   initial /= array[i]