; if n is a prime number and a < n, then
; a ^ n modulo n   is the same as  a modulo n

(define (prime? n)
    
    ; compute a ^ b modulo n. To do this we will exploit
    ; (xy) modulo m =  (( x modulo m )( y modulo m ) modulo m )
    ; a^b mod n
    ; b = 1  => a mod n
    ; b = even => (a^2)^(b/2) mod n
    ; b = odd => a*a^(b-1) mod n
    ;         => (( a mod n) ( a^(b-1) mod n ) ) mod n
    (define (expmod a b n)
        (cond
            ((= b 1) (remainder a n))
            ((even? b) (expmod (* a a) ( / b 2) n))
            (else (remainder ( * (remainder a n) (expmod a (- b 1) n)) n ))
        )
    )

    (define (possible-prime? )
        (define a ( + 1 (random (- n 1)))) ; random number between 1 and n-1
        ( = (expmod a n n) a )
    )

    ; we will try 2% of N + 10 ...
    (define attempts ( + 10 (floor ( / n 50))))

    (define (iter x)
        (display "iter\n")
        (display x)
        (cond
            ((= x 0 ) true )
            ((possible-prime?) (iter (- x 1)))
            (else false)
        )
    )

    ; Do the evaluation
    (display "prime\n")
    (display n)
    (iter attempts)
)



; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group prime1-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (prime? 2) "2 should be prime" )
        (check (prime? 3) "3 should be prime" )
        (check (prime? 7) "7 should be prime" )
        (check (prime? 11) "11 should be prime" )
        (check (prime? 23) "23 should be prime" )
        (check (prime? 31) "31 should be prime" )
        (check (not (prime? 30)) "30 should not be prime" )
        (check (not (prime? 323)) "323 should not be prime" )
        (check (not (prime? 391)) "391 should not be prime" )
        (check (prime? 6131) "6131 should be prime")
        ;(check (prime? 72467) "72467 should be prime")
        ;(check (prime? 88463) "88463 should be prime")
        (check (not (prime? 190061)) "190061 should not be prime" )
    )
)


; run all the tests
(run-registered-tests)

