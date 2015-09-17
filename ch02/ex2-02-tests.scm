(load "ex2-02.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (point-test1)
    (define point (make-point 10 20))
    (check (= (x-point point) 10) "X coordinate should be 10")
    (check (= (y-point point) 20) "Y coordiante should be 20")
)

; run all the tests
(run-registered-tests)




