#lang racket
(car ''abracadabra); esto se interpreta como (car (quote (quote abracadabra))) y, como car retorna el primer elemento, el interprete devuelve "'quote".