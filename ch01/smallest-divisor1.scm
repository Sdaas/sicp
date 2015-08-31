; Simple algorithm to find the smallest divisor
; See if the number can be divided by 2. If not, try the next number as divisor, etc
; This is terribly inefficient - as we end up dividing with _all_ even numbers.

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

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group smallest-divisor-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 1 (smallest-divisor 1 )) "smallest divisor of 1" )
        (check (= 2 (smallest-divisor 2 )) "smallest divisor of 2" )
        (check (= 13 (smallest-divisor 13 )) "smallest divisor of 17" )
        (check (= 17 (smallest-divisor 323 )) "smallest divisor of 323" )
        (check (= 7 (smallest-divisor 49 )) "smallest divisor of 49" )
    )
)


; run all the tests
(run-registered-tests)
