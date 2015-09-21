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

(define-test (center-test)
    (define tol 0.000001)
    (define n1 (make-center-width 5.0 0.2 ))
    (assert-in-delta (center n1) 5.0 tol "should be 5.0")
)

(define-test (width-test)
    (define tol 0.000001)
    (define n1 (make-center-width 5.0 0.2 ))
    (assert-in-delta (width n1) 0.2 tol "Center should be 0.2")
    
)
; run all the tests
(run-registered-tests)