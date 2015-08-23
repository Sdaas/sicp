;sin x ≈ x if x is sufficiently small (0.1 radians or less)
;sin x = 3 sin(x/3) − 4 sin^3(x/3)

(define (mysin x)
    (define (f x) ( - ( * 3 x) ( * 4 (expt x 3 ))) )
    (if ( < (abs x) 0.1 )
        x
        (f (mysin ( / x 3)))
    )
)
