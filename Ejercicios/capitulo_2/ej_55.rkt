#lang scheme

; Why does it print "quote"?
(car ''abracadabra)

; The result of the operation is the first element of the list (quote (quote (abracadabra)))
; Example:
(car (quote(quote(abracadabra))))
; Which is obviously "quote"