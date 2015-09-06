
(define (compose f g)
    (lambda (x) (f (g x)))
)

(define (square x) (* x x))
(define (inc x) (+ x 1))

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-42-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 49 ((compose square inc) 6))  "square(inc(6)) should be 49" )
    )
)

; run all the tests
(run-registered-tests)