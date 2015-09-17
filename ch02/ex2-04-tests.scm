(load "ex2-04.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test)
    (define p1 (my-cons 1 2 ))
    (check (= (my-car p1) 1) "should be 1")
    (check (= (my-cdr p1) 2) "should be 2")
)


; run all the tests
(run-registered-tests)