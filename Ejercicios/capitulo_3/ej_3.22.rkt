#lang racket
(define (make-queue)
  (let ((front-ptr (mcons 'empty null))
        (rear-ptr  (mcons 'empty null))
    (define (insert x)
      (if (eq? (mcar front-ptr) 'empty)
          (begin
            (set! front-ptr (mcons x null))
            (set! rear-ptr (mcons x null)))
          (begin
            (
            (set-mcdr! rear-ptr (mcons x null))
            (set! rear-ptr (mcdr rear-ptr))))))
    (define (dispatch m)
      (cond ((eq? mensaje 'insert) insert)))
    dispatch)))
      
(define lista (make-queue))
(lista insert 2)