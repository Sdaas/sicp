(load "append.scm") ;append one element to the end of the list

; The classic filter function. 

; Apply the function f on each element of the list x, and return a list of
; only those elements for which the function f evals to true
; BTW, scheme already has a filter function, so we call this my-filter
(define (my-filter f x)
    
    (define (inner inlist outlist)
        ;(print "inner called with " inlist " " outlist "\n");
        (if (null? inlist)
            outlist
            (if (f (car inlist))
                (inner (cdr inlist) (my-append outlist (car inlist)))
                (inner (cdr inlist) outlist)
            )
        )
    )
    
    (inner x (list ))
)

;Remember that (cons n x)  can be used to append the list 
; x to the number n. However, (cons x n) will just lead to the creation of a pair 
; that contains x and n