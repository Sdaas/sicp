(load "ex2-01.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test1)
    ; Create a rational number with positive numerator and denominator
    (define rat (make-rat 4 5))
    (check (= (numer rat) 4) "Numerator should be 4")
    (check (= (denom rat) 5) "Denominator should be 5")
)


(define-test (test2)
    ; Create a rational number with negative numerator
    (define rat (make-rat -4 5))
    (check (= (numer rat) -4) "Numerator should be -4")
    (check (= (denom rat) 5) "Denominator should be 5")
)


(define-test (test3)
    ; Create a rational number with negative denominator
    (define rat (make-rat 4 -5))
    (check (= (numer rat) -4) "Numerator should be -4")
    (check (= (denom rat) 5) "Denominator should be 5")
)

(define-test (test4)
    ; Create a rational number with negative numerator and denominator
    (define rat (make-rat -4 -5))
    (check (= (numer rat) 4) "Numerator should be 4")
    (check (= (denom rat) 5) "Denominator should be 5")
)


(define-test (test5)
    ; Create a rational number with zero numerator
    (define rat (make-rat 0 -7))
    (check (= (numer rat) 0) "Numerator should be 0")
    (check (= (denom rat) 1) "Denominator should be 1")
)


(define-test (test6)
    ; Create a rational number with zero numerator
    (define rat (make-rat 0 8))
    (check (= (numer rat) 0) "Numerator should be 0")
    (check (= (denom rat) ) "Denominator should be 1")
)

(define-test (test7)
    ; numerator and denominator are mutually prime
    (define rat (make-rat 13 17))
    (check (= (numer rat) 13) "Numerator should be 13")
    (check (= (denom rat) 17) "Denominator should be 17")
)

(define-test (test8)
    ; numerator and denominator are NOT mutually prime
    (define rat (make-rat 10 20))
    (check (= (numer rat) 1) "Numerator should be 1")
    (check (= (denom rat) 2) "Denominator should be 2")
)

(define-test (test9)
    ; numerator and denominator are NOT mutually prime
    (define rat (make-rat 15 -20))
    (check (= (numer rat) -3) "Numerator should be -3")
    (check (= (denom rat) 4) "Denominator should be 4")
)

; run all the tests
(run-registered-tests)




