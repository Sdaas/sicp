(load "ex2-01.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

;define the unit tests
(define-test (test1)
    ; Create a rational number with positive numerator and denominator
    (define rat (make-rat 4 5))
    (check (= (numer rat) 4) "Numerator should be 4")
    (check (= (denom rat) 5) "Denominator should be 5")
)

;define the unit tests
(define-test (test2)
    ; Create a rational number with negative numerator
    (define rat (make-rat -4 5))
    (check (= (numer rat) -4) "Numerator should be -4")
    (check (= (denom rat) 5) "Denominator should be 5")
)

;define the unit tests
(define-test (test3)
    ; Create a rational number with negative denominator
    (define rat (make-rat 4 -5))
    (check (= (numer rat) -4) "Numerator should be -4")
    (check (= (denom rat) 5) "Denominator should be 5")
)

;define the unit tests
(define-test (test4)
    ; Create a rational number with negative numerator and denominator
    (define rat (make-rat -4 -5))
    (check (= (numer rat) 4) "Numerator should be 4")
    (check (= (denom rat) 5) "Denominator should be 5")
)

;define the unit tests
(define-test (test5)
    ; Create a rational number with zero numerator
    (define rat (make-rat 0 -7))
    (check (= (numer rat) 0) "Numerator should be 0")
    (check (= (denom rat) 7) "Denominator should be 7")
)

;define the unit tests
(define-test (test6)
    ; Create a rational number with zero numerator
    (define rat (make-rat 0 8))
    (check (= (numer rat) 0) "Numerator should be 0")
    (check (= (denom rat) 8) "Denominator should be 8")
)

; run all the tests
(run-registered-tests)




