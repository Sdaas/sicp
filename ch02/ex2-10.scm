(define (div-interval x y)
    (define (spans-zero x)
        ( and (<= (lower-bound x) 0 ) (>= (upper-bound x) 0) )
    )

    (if (spans-zero y)
        (error "denominator spans zero")
        (mul-interval
            x
            (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
        )
    )
)

