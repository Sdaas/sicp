

; Enumerate (in left to right order (infix) all the nodes of a tree)
; Remember that this function returns a list
(define (enumerate-tree tree)
    (cond
        ( (null? tree) (list)) ; return an empty list
        ( (not (pair? tree)) (list tree) ) ; return current node as a list
        ( else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
    )
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

; The older version - also implemented in ex2-28
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