(load "ex1-42.scm"); reusing compose ..

; apply the function f n number of times
(define (repeated f n)
    (if (= n 1)
        (lambda (x) (f x))
        (lambda (x) ( f ((repeated f (- n 1)) x)))
    )
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-43-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 25 ((repeated (lambda (x) (* x x)) 1) 5)) "square 5 should be 25" )
        (check (= 10 ((repeated (lambda (x) (* x 2)) 1) 5)) "double 5 should be 10" )
        (check (= 64 ((repeated (lambda (x) (* x 2)) 5) 2)) "double 2 five times  should be 64" )
        (check (= 625 ((repeated (lambda (x) (* x x)) 2) 5)) "square.square.5 should be 625" )
    )
)

; run all the tests
(run-registered-tests)