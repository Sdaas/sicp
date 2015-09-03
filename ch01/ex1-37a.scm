
; recursive solution
(define (cont-frac nfunc dfunc k)
    (define (part n)
        (if (= k n)
            ( / ( nfunc n) (dfunc n))
            ( / ( nfunc n) (+ (dfunc n) (part (+ n 1))))
        )
    )

    ; evaluate
    (part 1)
)

(define (golden-ratio)
    (define (identity x) 1.0 )
    ( / 1 (cont-frac identity identity 100))
)

(define (golden-ratio2)
    ( / ( + 1 (sqrt 5)) 2 )
)