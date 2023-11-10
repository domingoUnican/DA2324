#lang racket
(define (p n k)
  (cond ((or (= n 0) (= k 0)) 1)
        ((and (>= n 0) (>= k 1))
         (cond ((= k 1) 1)
               ((> k n) (p n n))
               (else (+ (p n (- k 1)) (p (- n k) k))))
         )
        (else 0)))

(define (make-table)
  (mcons 'table null))

(define (lookup key-1 key-2 table)
  (let ((subtable (assoc key-1 (mcdr table))))
    (if subtable
        (let ((record 
               (assoc key-2 (mcdr subtable))))
          (if record (cdr record) false))
        false)))

(define (insert! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (mcdr table))))
    (if subtable
        (let ((record 
               (assoc key-2 (mcdr subtable))))
          (if record
              (set-mcdr! record value)
              (set-mcdr! 
               subtable
               (cons (cons key-2 value)
                     (mcdr subtable)))))
        (set-mcdr! 
         table
         (cons (list key-1 (cons key-2 value))
               (mcdr table)))))
  'ok)




(define (memoize f)
  (let ((table (make-table)))
    (lambda (n k)
      (let ((previously-computed-result 
             (lookup n k table)))
        (or previously-computed-result
            (let ((result (f n k)))
              (insert! n k result table)
              result))))))

(define (para-cada proc inicio fin n k)
  (if (> inicio fin)
      0
      (begin
        (proc inicio n k)
        (para-cada proc (+ inicio 1) fin n k))))
  
(define (p-bottom-up n k)
  (define table (make-table))
  (define (es-necesario? n k f c)
    (<= c (floor (/ (- n f) (ceiling (/ (- n f) k))))))
    
  (define (cuerpo-for indice n k)
    (define f (floor (/ indice (+ k 1))))
    (define c (remainder indice (+ k 1)))
    (if (es-necesario? n k f c)
        (cond ((= f 0) (insert! f c 1 table))
              ((and (= c 0) (> f 0)) (insert! f c 0 table))
              ((< (- f c) 0) (insert! f c (lookup f (- c 1) table) table))
              (else (insert! f c (+ (lookup f (- c 1) table) (lookup (- f c) c table) table))))
        0))
  (para-cada cuerpo-for 1 (* n k) n k))
  
    
  


; ejemplos
(p 5 2)
(p 8 5)
(p 2 8)
(p 7 4)

;((memoize p) 8 5)
(p-bottom-up 5 2)
(p-bottom-up 8 5)
(p-bottom-up 2 8)
(p-bottom-up 7 4)
