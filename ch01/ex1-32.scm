; accumulate with a generic combiner - iterative version
(define (accumulate combiner null-value term a next b)
    ; define an iterative process
    (define (iter a accumulator)
        (if (> a b )
            accumulator
            (iter (next a) ( combiner accumulator (term a)))
        )
    )
    ; start the calculation
    (iter a null-value )
)


; accumulate with a generic combiner - recursive version
; not writing the unit tests for this ...
(define (accumulate2 combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a ) (prod term (next a ) next b ))
    )
)

; the "sum" function defined in terms of generic combiner
(define (sum term a next b)
    (accumulate + 0 term a next b)
)


; the "product" function defined in terms of generic combiner
(define (prod term a next b)
   (accumulate * 1 term a next b)
)


; factorial in terms of product
(define (factorial n)
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (prod identity 1 inc n)
)

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

; pi/4 = (2.4 / 3^2)(4.6/5^2)(6.8/7^2) ...
(define (mypi)
    (define (term x) ( / (* (- x 1) (+ x 1)) (* x x )))
    (define (next x) ( + x 2))
    (* 4 (prod term 3.0 next 10000.0))
)


; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group sumint-tests
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
