; Section 1.3.1 - Procedure as Arguments
(define (sum term a next b)
    ; define an iterative process
    (define (iter a accumulator)
        (if (> a b )
            accumulator
            (iter (next a) ( + accumulator (term a)))
        )
    )
    ; start the calculation
    (iter a 0 )
)

; Test Vectors

; sum of integers
(define (sumint a b)
    (define (identity x) x)
    (define (inc x) (+ 1 x))
    (sum identity a inc b)
)

; sum of squares ...
(define (sumsquares a b)
    (define (sqr x) (* x x))
    (define (inc x) (+ 1 x))
    (sum sqr a inc b)
)

; compute the value of pi as 
; 1/(1.3) + 1/(5.7) + 1/(9.11) ...

(define (mypi)
    (define (term x) (/ 1 ( * x (+ x 2))) )
    (define (next x) (+ 4 x ))
    ; The summation is pi/8
    (* (sum term 1.0 next 10000) 8)
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-30-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 10 (sumint 1 4)) "1+2+3+4 = 10" )
        (check (= 45 (sumint 5 10)) "5+..+10 = 45" )
        (check (= 0 (sumint 10 0)) "should return 0" )
        (check (= 5 (sumint 5 5)) "should return 5" )
    )
)

(in-test-group sumsquares-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 30 (sumsquares 1 4)) "1^2+..+4^2 = 30" )
        (check (= 355 (sumsquares 5 10)) "5^2+..+10^2 = 355" )
        (check (= 0 (sumsquares 10 0)) "should return 0" )
        (check (= 25 (sumsquares 5 5)) "should return 25" )
    )
)

; run all the tests
(run-registered-tests)