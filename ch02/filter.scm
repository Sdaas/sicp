(load "append.scm") ;append one element to the end of the list

; The classic filter function. 

; Filter "items" based on predicate, and return  new list that contain only the matching elements
(define (my-filter predicate items)
    
    (cond
        ( (null? items) items)
        ( (predicate (car items)) (cons (car items) (filter predicate (cdr items))))
        ( else (filter predicate (cdr items)))
    )
)

;Remember that (cons n x)  can be used to append the list 
; x to the number n. However, (cons x n) will just lead to the creation of a pair 
; that contains x and n

(define (my-filter-old-version f x)
    
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