; a procedure "double"
; takes in arg1 and and returns a function that applies the arg twice

(define (double f)
    (lambda (x) (f (f x)))
)


(define (square x) ( * x x))
(define (cube x) ( * x x x ))


; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-41-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 16 ((double square) 2)) "(2^2)^2 = 16" )
        (check (= 81 ((double square) 3)) "(3^2)^2 = 81" )
        (check (= 512 ((double cube) 2)) "(2^3)^3 = 512" )

    )
)

; run all the tests
(run-registered-tests)
