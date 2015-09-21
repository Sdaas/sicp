(load "ex2-08.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test1)
    (define tol 0.000001)

    (define n1 (make-interval 1.5 1.7 ))
    (define n2 (make-interval 0.9 1.1 ))

    (define n3 (add-interval n1 n2))
    (assert-in-delta (lower-bound n3) 2.4 tol "should be 2.4")
    (assert-in-delta (upper-bound n3) 2.8 tol "should be 2.8")

    ; n4 = n3-n2. So n4 should the same as n1
    (define n4 (sub-interval n3 n2))
    (assert-in-delta (lower-bound n4) 1.5 tol "should be 1.5")
    (assert-in-delta (upper-bound n4) 1.7 tol "should be 1.7")

)

; run all the tests
(run-registered-tests)