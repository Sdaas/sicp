
(load "map.scm")       ; The classic map function
(load "filter.scm")    ; The classic filter function

;Note : Scheme actually has a map/filter function - I wrote my own just to understand them better

; Return a list of numbers that have the same parity (even/odd) as the first number in the list
(define (same-parity . x)
    (define (check y) (= (remainder y 2) (remainder (car x) 2)))
    (my-filter check (cdr x))
)
