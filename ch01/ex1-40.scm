
(load "newton.scm")

; Definition of a quadratic function  x^2 + ax + b
(define (quadratic a b )
    (lambda (x) ( + (* x x) (* a x) b))
)

; Definition of a cubic function  x^3 + ax^2 + bx + c
(define (cubic a b c )
    (lambda (x) ( + (* x x x ) (* a x x) (* b x) c))
)

; All the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-40-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 1.000 (newtons-method (quadratic 1 -2) 0) tol "Root of X^2 + x - 2 are 1, -2" )
        (assert-in-delta -2.000 (newtons-method (quadratic 1 -2) -3.0) tol "Root of X^2 + x - 2 are 1, -2" )
        (assert-in-delta -2.000 (newtons-method (cubic 2 -1 -2) -4) tol "roots are -2, -1 and 1" )
        (assert-in-delta -1.000 (newtons-method (cubic 2 -1 -2) -0.5) tol "roots are -2, -1 and 1" )
        (assert-in-delta 1.000 (newtons-method (cubic 2 -1 -2) 10) tol "roots are -2, -1 and 1" )
    )
)

; run all the tests
(run-registered-tests)