(load "gcd.scm")

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group gcd-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 3 (gcd 6 9)) "GCD of 6 and 9 is 3" )
        (check (= 12 (gcd 660 252)) "GCD of 660 and 252 is 12")
        (check (= 1 (gcd 11 17)) "GCD of 11 and 17 is 1")
    )
)


; run all the tests
(run-registered-tests)
