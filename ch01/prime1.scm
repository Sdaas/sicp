; Simple algorithm to find whether n is a prime number
(define (prime? n)
    
    (define (smallest-divisor n)
        (define (iter x)
            (cond
                ((> (square x) n ) n) ; we have looked upto sqrt(n) and it does not divide
                ((= 0 (remainder n x)) x )  ; clearly x divdes the number
                (else (iter (+ x 1)))   ; does not divide. so try the next number
            )
        )

        (iter 2); look for divisors, starting from 2
    )

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
