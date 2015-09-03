; Reference
; 
; https://en.wikipedia.org/wiki/Euler%27s_continued_fraction_formula
;
;  1 2 1 1 4 1 1 6 1 1 8 1 1 10 1 1 
;  All elements where (i+1) is a multple of 3  are not 1. 
;  For these elements  k = (i+1)/3, and the value is 2k
;
; v       2 4 6 8 10 
; k       1 2 3 4  5
; i       2 5 8 11 14
; i+1     3 6 9 12 15 

(load "ex1-37b.scm")


(define (e)
    (define (identity x) 1.0 )
    (define (dfunc x)
        (if (= 0 (remainder (+ x 1) 3))
            (* 2 (/ (+ x 1) 3))
            1
        )
    )
    (+ 2 (cont-frac identity dfunc 100))
)


; All the unit tests
(load "../test-manager/load.scm")

(in-test-group e-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta (e) (exp 1) tol "e based on euler's expansion" )
    )
)

; run all the tests
(run-registered-tests)