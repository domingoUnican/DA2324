#lang racket
(define(make-rat n d)(cons n d));ldevuelva un "objeto" de tipo racional
(define (numer x)(car x));devuelve el numerador
(define (denom x)(cdr x));devuelve el denominador

(define (add-rat x y)
(make-rat (+ (* (numer x) (denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (sub-rat x y)
(make-rat (- (* (numer x) (denom y))
(* (numer y) (denom x)))
(* (denom x) (denom y))))

(define (mul-rat x y)
(make-rat (* (numer x) (numer y))
(* (denom x) (denom y))))

(define (div-rat x y)
(make-rat (* (numer x) (denom y))
(* (denom x) (numer y))))

(define (equal-rat? x y)
(= (* (numer x) (denom y))
(* (numer y) (denom x))))