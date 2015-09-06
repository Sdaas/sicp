
; recursive solution
(define (cont-frac nfunc dfunc k combiner)
    (define (part n)
        (if (= k n)
            ( / ( nfunc n) (dfunc n))
            ( / ( nfunc n) (combiner (dfunc n) (part (+ n 1))))
        )
    )

    ; evaluate
    (part 1)
)

(define (golden-ratio)
    (define (identity x) 1.0 )
    ( / 1 (cont-frac identity identity 100 +))
)

(define (golden-ratio2)
    ( / ( + 1 (sqrt 5)) 2 )
)


; All the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-37a-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta (golden-ratio) (golden-ratio2) tol "golden-ratio" )
    )
)

; run all the tests
(run-registered-tests)