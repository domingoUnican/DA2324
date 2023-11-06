#lang racket
 (define (mul-streams s1 s2) 
   (stream-map * s1 s2)) 
  
 (define factorials  
   (stream-cons 1  
                (mul-streams factorials (stream-cdr integers)))) 