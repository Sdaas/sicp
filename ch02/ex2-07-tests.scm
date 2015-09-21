(load "sec2-1-4.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test)
    (define p1 (make-interval 1.5 1.7 ))
    (check (= (lower-bound p1) 1.5) "should be 1.5")
    (check (= (upper-bound p1) 1.7) "should be 1.7")
)


; run all the tests
(run-registered-tests)