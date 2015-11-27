
(load "map.scm")       ; The classic map function

; Square a list using map ...
(define (square-list-1 items)
    (define (square x) (* x x)) ; a function that does the squaring
    (my-map square items )
)

; Square a list in the normal brain-dead way (aka not using map)
(define (square-list-2 items)
    (if (null? items)
        (list) ; create and return an empty list 
        (cons (square (car items)) (square-list-2 (cdr items)) )
    )
)
