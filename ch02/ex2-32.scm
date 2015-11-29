(define (subsets s)
    (if (null? s)
        (list (list)) ; 
        (let ( (rest (subsets (cdr s)))
               (first (car s)))
            (append rest (map (lambda (x) (append (list first) x)) rest))
        )
    )
)

; Consider the list (1 2 3)
; In this case, rest is the subset of (2 3), which becomes (2) (3) and (2 3)
; For each of these sets, there are two variants, one with 1 and one without 2
; which means  (2) (3) (2 3)   and (1 2) (1 3) (1 2 3)

; s = (1 2)
; car s = 1
; cdr s = (2)
; rest = (() (2))
; 
; ( () (2) )   ( (1) (1 2))

; s = (2)
; car s = 2
; cdr s = ()
; rest = ( () )
; ( () ) ( (2) )