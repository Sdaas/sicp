; A procedure can evaluate to an operator
; In this case, if b > 0, it returns the "+" operator, else it returns the "-" opr
(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))


; All the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-4tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 0 (a-plus-abs-b 0 0)) "0 + abs(0) should be 0" )
        (check (= 5 (a-plus-abs-b 2 3)) "2 + abs(3) should be 5" )
        (check (= 5 (a-plus-abs-b 2 -3)) "2 + abs(-3) should be 5" )
    )
)

; run all the tests
(run-registered-tests)