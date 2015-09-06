; Reference
; 
; See http://functions.wolfram.com/ElementaryFunctions/Tan/10/
;

(load "ex1-37b.scm")


(define (tan-cf x)
    (define (nfunc k) (if (= 1 k )  x (* x x ))) ; x for k=1 x^2 for all other values
    (define (dfunc k) ( - (* 2 k ) 1))   
    (cont-frac nfunc dfunc 50 -)
)


; All the unit tests
(load "../test-manager/load.scm")

(in-test-group e-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta (tan-cf (/ 3.14159 4)) 1.0000 tol "tan pi/4 should be 1" )
        (assert-in-delta (tan-cf (/ 3.14159 8)) 0.41421 tol "tan pi/8 should be 0.4142" )
    )
)

; run all the tests
(run-registered-tests)


