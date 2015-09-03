
; iterative solution
(define (cont-frac nfunc dfunc k)
    (define (part accumulator i)
        (if (= i 0)
            accumulator
            (part ( / (nfunc i) (+ (dfunc i) accumulator)) (- i 1))
        )
    )

    (part 0 k)
)

(define (golden-ratio)
    (define (identity x) 1.0 )
    ( / 1 (cont-frac identity identity 100))
)

(define (golden-ratio2)
    ( / ( + 1 (sqrt 5)) 2 )
)
