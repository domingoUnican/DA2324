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
  (mcons 'table (mlist))); Hay que utilizar las nuevas listas

(define (mlist . z )
  (define (cons-list h)
    (if (null?  h)
        (mcons null null)
        (mcons (car h) (cons-list (cdr h)))))
  (cons-list z)
  );; El problema que habeís tenido es que mezclais list y mlist, que no están definidas.
 
(define (massoc key list)
  (cond ((null? list) list) ; devolvemos la lista en caso de estar al final
        ((and (mpair? (mcar list)) (equal? (mcar (mcar list)) key)) (mcar (mcdr (mcar list))))
        (else (massoc key (mcdr list)))) ; como teneís que ir modificando la lista
)

(define (mappend list p)
  (if (and (mpair? list) (equal? (mcdr list) (mcons null null)))
      (set-mcdr! list (mcons p (mcons null null)))
      (mappend (mcdr list) p)))

(define (minsert! key value list)
  (if (null? (massoc key list))
      (mappend list (mcons key (mcons value null)))
      (set-mcdr! (massoc key list) (mcons value null))))


(define (memoize f)
  (let ((table (make-table)))
    (lambda (n k)
      (let ((previously-computed-result 
             (massoc (cons n k) table)))
        (if (equal? '() previously-computed-result)
            (let ((result (f n k)))
              (minsert! (cons n k) result table)
              result)
            previously-computed-result)))))


(define (para-cada proc inicio fin n k)
  (if (> inicio fin)
      0
      (begin
        (proc inicio n k)
        (para-cada proc (+ inicio 1) fin n k))))

(define (p-bottom-up n k)
  (define table (make-table))
  (define (es-necesario? n k f c)
    (let ((b (ceiling (/ (- n f) k))))
      (if (= b 0)
          true
          (<= c (floor (/ (- n f) b))))))
    
  (define (cuerpo-for indice n k)
    (let ((f (floor (/ indice (+ k 1))))
          (c (remainder indice (+ k 1))))
    (if (es-necesario? n k f c)
        (cond ((= f 0) (minsert! (cons f c) 1 table))
              ((and (= c 0) (> f 0)) (minsert! (cons f c) 0 table))
              ((< (- f c) 0) (minsert! (cons f c) (massoc (cons f (- c 1)) table) table))
              (else (minsert! (cons f c) (+ (massoc (cons f (- c 1)) table) (massoc (cons (- f c) c) table)) table)))
        0)))
  (para-cada cuerpo-for 1 (* (+ n 1) (+ k 1)) n k)
  (massoc (cons n k) table))
  

; ejemplos
(p 5 2)
(p 8 5)
(p 2 8)
(p 7 4)

((memoize p) 2 8)

(p-bottom-up 5 2)
(p-bottom-up 8 5)
(p-bottom-up 2 8)
(p-bottom-up 7 4)
