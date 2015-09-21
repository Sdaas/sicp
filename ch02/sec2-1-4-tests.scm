(load "sec2-1-4.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (mul-test1)
    (define tol 0.000001)

    (define n1 (make-interval 0.9 1.1 ))
    (define n2 (make-interval 1.9 2.1 ))

    (define n3 (mul-interval n1 n2))
    (assert-in-delta (lower-bound n3) 1.71 tol "should be 1.71")
    (assert-in-delta (upper-bound n3) 2.31 tol "should be 2.31")
)

(define-test (div-test2)
    (define tol 0.000001)

    (define n2 (make-interval 1.9 2.1 ))
    (define n3 (make-interval 1.71 2.31 ))
    ; n4 = n3/n2. So n4 should the same as n1
    (define n4 (div-interval n3 n2))
    (assert-in-delta (lower-bound n4) 0.9 tol "should be 0.9")
    (assert-in-delta (upper-bound n4) 1.1 tol "should be 1.1")

)

; run all the tests
(run-registered-tests)