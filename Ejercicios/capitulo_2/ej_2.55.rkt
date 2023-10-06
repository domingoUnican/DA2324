#lang racket
(car ''abracadabra)
; esta instruccion es equivalente a:
; (car (quote (quote abracadabra))
; Por tanto, hace un quote de otra instrucción quote y esto significa
; que su primer elemento es la propia invocación del segundo quote, el anidado