(load "smallest-divisor1.scm") 

; Simple algorithm to find whether n is a prime number
(define (prime? n)
    
    ; a number is prime if its smallest divisor is the number itself
    (= n (smallest-divisor n))
)


; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group prime1-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (prime? 1) "1 should be prime" )
        (check (prime? 2) "2 should be prime" )
        (check (prime? 3) "3 should be prime" )
        (check (prime? 7) "7 should be prime" )
        (check (prime? 11) "11 should be prime" )
        (check (prime? 23) "23 should be prime" )
        (check (prime? 31) "31 should be prime" )
        (check (not (prime? 30)) "30 should not prime" )
        (check (not (prime? 323)) "332 should not prime" )
    )
)


; run all the tests
(run-registered-tests)
