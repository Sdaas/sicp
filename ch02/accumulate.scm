
; Accumulate.
; Accumulate all the items in the list using the specified operator and the initial value

(define (accumulate oper init-value items)
    (if (null? items)
        init-value
        (accumulate oper (oper init-value (car items)) (cdr items))
    )
)