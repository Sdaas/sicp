; The sum of squares of  prime numbers in the range a .. b 

(load "gcd.scm")    ; for gcd
(load "ex1-33.scm") ; for filtered-accumulate


; The product of all positive integers less than n that are relatively prime
; to n , i.e, gcd(n,x) = 1   ( e.g 9 and 4 )
(define (f n)
    (define (relative-prime? x) (= 1 (gcd n x)) )
    (define (identity x) x)
    (define (inc x) (+ x 1))
    (filtered-accumulate relative-prime? + 0 identity 1 inc n)
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group f-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 4 (f 4)) "1 + 3 = 4" )
        (check (= 21 (f 7)) "1 + 2 + 3 + 4 + 5 + 6 = 21" )
        (check (= 24 (f 12)) "1 + 5 + 7 + 11  = 24" )
    )
)

; run all the tests
(run-registered-tests)
