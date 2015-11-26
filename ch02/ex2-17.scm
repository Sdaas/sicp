
; Define a procedure last-pair that returns the -list- that contains the 
; last element of a given (non-empty) list

;returns a list that contains the last element of the list x
(define (last-pair x)
    (if (null? (cdr x))  
        x
        (last-pair (cdr x))
    )
)
