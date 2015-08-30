
; Compute b to the power n
; expt is a built-in function that will do this
(define (exp b n)

    ; we will manipulate so that a.b^n remains constant. In each iteration
    ; we wil attempt to reduce n by 2. If it is odd, we will multiply a with b
    (define (iter a b n)
        (cond ( (= n 0 ) a)
            ( (even? n) (iter a (* b b) (/ n 2)))
            ( else (iter ( * a b) (* b b) (floor (/ n 2))))
        )
    )
    ; Evaluate
    (iter 1 b n)
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-16tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 1 (exp 10 0)) "10 ^ 0 should be 1" )
        (check (= 10 (exp 10 1)) "10 ^ 1 should be 10" )
        (check (= 256 (exp 2 8)) "2 ^ 8 " )
        (check (= 8388608 (exp 2 23)) "2 ^ 23" )
        (check (= 147573952589676412928 (exp 2 67)) "2 ^ 67 ")
    )
)

; run all the tests
(run-registered-tests)