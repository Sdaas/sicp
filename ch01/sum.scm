; Section 1.3.1 - Procedure as Arguments
(define (sum term a next b)
    (if (> a b)
        0
        ( + ( term a) ( sum term (next a) next b))
    )
)