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

; F ( 1 (2 3 ) 4 )
; I ( 1 ( 2 3 ) 4)  ()
; I ( ( 2 3) 4)  (1)

    ; I (2 3) (1)
    ; I (3) (1 2)
    ; I () (1 2 3)  ... return 1 2 3

; I (4) (123)