#lang scheme

(list 'a 'b 'c) ; (a b c): One list with the three elements
(list (list 'george)) ;((george)): A list inside another list with one element
(cdr '((x1 x2) (y1 y2))); ((y1 y2)): It takes the right part of the list (A, B) which is also a list 
(cadr '((x1 x2) (y1 y2))) ; (y1 y2): It takes the first (and only) element of the right part of the list (A, B)
(pair? (car '(a short list))) ; #f: It checks if the first element of the list ("a") is a pair
(memq 'red '((red shoes) (blue socks))); #f: It checks if "red" is in (("red shoes"), ("blue socks"))
(memq 'red '(red shoes blue socks)) ; (red shoes blue socks): It checks if "red" is in ("red shoes blue socks")
