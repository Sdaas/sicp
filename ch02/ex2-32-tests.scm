(load "ex2-32.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; empty set
(define-test (test0)
    (define empty (list))
    (define expected (list (list)))
    (check (equal? expected (subsets empty)) "should return an empty list")
)

; set with just 1 element
(define-test (test1)
    (define items (list 1 ))
    (define expected (list (list) (list 1)))
    (check (equal? expected (subsets items)) "should return () (1)")
)

; set with just 2 element
(define-test (test2)
    (define items (list 1 2))
    (define expected (list (list) (list 2) (list 1) (list 1 2)))
    (check (equal? expected (subsets items)) "should return () (1) (2) (1 2)")
)

; set with just 3 element
(define-test (test3)
    (define items (list 1 2 3))
    (define expected (list (list) (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))
    (check (equal? expected (subsets items)) "should return () (1) (2) (3) (1 2) (1 3) (2 3) (1 2 3)")
)


; run all the tests
(run-registered-tests)

;(run-test '(test1))

