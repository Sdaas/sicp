; Define a procedure that takes three numbers as 
; arguments and returns the sum of the squares 
; of the two larger numbers.

(define (sumofsquares x y) ( + (* x x ) (* y y)))
(define (myfunc a b c) 
        (cond
            ( (and (<= a b) (<= a c)) (sumofsquares b c))
            ( (and (<= b a) (<= b c)) (sumofsquares a c))
            ( (and (<= c a) (<= c b)) (sumofsquares a b))
        )
)

; Interesting test conditions
; 1 1 1
; 1 2 2
; 1 1 2

; All the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-3tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 13 (myfunc 3 1 2)) "should return 13" )
        (check (= 13 (myfunc 1 2 3)) "should return 13" )
        (check (= 2 (myfunc 1 1 1)) "should return 2" )
        (check (= 8 (myfunc 1 2 2)) "should return 8" )
        (check (= 5 (myfunc 1 1 2)) "should return 5" )
    )
)

; run all the tests
(run-registered-tests)

; Can run individual groups or tests with
;(run-test '(ex1-3tests))
;(run-test '(simple-stuff arithmetic))