(define (fringe items)

    (define (inner inlist outlist)
        (cond
            ((null? inlist) outlist)
            ((pair? (car inlist)) (inner (cdr inlist) (inner (car inlist) outlist)))
            (else (inner (cdr inlist) (append outlist (list (car inlist)))))
        )
    )

    (inner items (list)) ; start off the iterative process with a empty outlist
)

;
; F ( 1 (2 3 ) 4 )
; I ( 1 ( 2 3 ) 4)  ()
; I ( ( 2 3) 4)  (1)
    ; The first element in the list is a pair
    ; I (2 3) (1)
    ; I (3) (1 2)
    ; I () (1 2 3)  ... return 1 2 3
    ; The key here is that the outlist returned by the call to I() must 
    ; be fed as the outlist to the next I() call
; I (4) (1 2 3)