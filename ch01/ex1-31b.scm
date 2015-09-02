; iterative version
(define (prod term a next b)
    (define (iter a accum)
        (if (> a b)
            accum
            (iter (next a) (* accum (term a)))
        )
    )
    (iter a 1)
)

; factorial
(define (factorial n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (prod identity 1 inc n)
)

; pi/4 = (2.4 / 3^2)(4.6/5^2)(6.8/7^2) ...
(define (mypi)
    (define (term x) ( / (* (- x 1) (+ x 1)) (* x x )))
    (define (next x) ( + x 2))
    (* 4 (prod term 3.0 next 10000.0))
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group factorial-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 1 (factorial 1 )) "should return 1" )
        (check (= 2 (factorial 2)) "should return 2" )
        (check (= 24 (factorial 4)) "should return 24" )
        (check (= 5040 (factorial 7)) "should return 5040" )
    )
)


; run all the tests
(run-registered-tests)