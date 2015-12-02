
; Accumulate.
; Accumulate all the items in the list using the specified operator and the initial value
; The first param to operator is the next element from items
; The second param to operator is the initial-valuee
(define (accumulate oper init-value items)
    (if (null? items)
        init-value
        (accumulate oper (oper (car items) init-value) (cdr items))
    )
)

; For example 
; (acc * 10 (1 2 3 4))
; (acc * (* 1 10) (2 3 4))
; We can see here that the initial value is multiplied by the -first- element fo sequence
; So we have
; ((10*1) * 2 ) * 3 ) * 4 ) left associative

; The way it is done in the book is slightly different. As can be seen in the example below
;
; (acc * 10 (1 2 3 4))
; (* 1 (acc * 10 (2 3 4)))
; (* 1 (* 2 (acc * 10 ( 3 4))))
; (* 1 (* 2 (* 3 (acc * 10 ( 4)))))
; (* 1 (*2  (*3  (* 4 (acc * 10 ())))))
; (* 1 (*2  (*3  (* 4 10))))

; The initial value actually operates only with the _last_ element of 