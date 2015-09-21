(load "ex2-05.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test1)
    (define p1 (make-pair 3 5))
    (check (= (first-number p1) 3) "should be 3")
    (check (= (second-number p1) 5) "should be 5")
)

(define-test (test2)
    (define p1 (make-pair 5 5))
    (check (= (first-number p1) 5) "should be 5")
    (check (= (second-number p1) 5) "should be 5")
)

(define-test (test3)
    (define p1 (make-pair 0 0))
    (check (= (first-number p1) 0) "should be 0")
    (check (= (second-number p1) 0) "should be 0")
)

(define-test (test4)
    (define p1 (make-pair 1 1))
    (check (= (first-number p1) 1) "should be 1")
    (check (= (second-number p1) 1) "should be 1")
)


; run all the tests
(run-registered-tests)