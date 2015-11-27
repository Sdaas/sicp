(load "ex2-20.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")


(define-test (test1)
   (define expected (list 3 9))
   (check (equal? expected (same-parity 7 3 9 2 4)) "List should contains the elemens with the right parity")
)

(define-test (test2)
   (define expected (list 2 4))
   (check (equal? expected (same-parity 4 1 2 3 4)) "List should contains the elemens with the right parity")
)

; edge case where the input contains one item
(define-test (test3)
   (check (null? (same-parity 10)) "shoudl return empty list")
)

; run all the tests
(run-registered-tests)