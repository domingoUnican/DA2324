#lang racket

(define (last-pair list)
  (if (= (length list) 1)
      (car list)
      (last-pair (cdr list))))

(last-pair '(1 2 3 4 5 13827401))