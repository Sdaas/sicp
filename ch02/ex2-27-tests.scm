(load "ex2-27.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; empty list
(define-test (test0)
    (define empty (list))
    (check (equal? empty (deep-reverse empty)) "should return an empty list")
)

; list of numbers
(define-test (test1)
    (define items (list 1 2 3 4 5))
    (define expected (list 5 4 3 2 1))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; list of just one number
(define-test (test1a)
    (define items (list 1))
    (define expected (list 1))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; list followed by numbers
(define-test (test2)
    (define items (list (list 1 2) 3 4))
    (define expected (list 4 3 (list 2 1)))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; single list entry
(define-test (test3)
    (define items (list (list 1 2)))
    (define expected (list (list 2 1)))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; number followed by list
(define-test (test4)
    (define items (list 1 2 (list 3 4)))
    (define expected (list (list 4 3) 2 1))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; list of lists
(define-test (test5)
    (define items (list (list 1 2) (list 3 4)))
    (define expected (list (list 4 3) (list 2 1)))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; list of lists
(define-test (test6)
    (define items (list (list 1 2) (list 3 4) (list 5 6)))
    (define expected (list (list 6 5) (list 4 3) (list 2 1)))
    (check (equal? expected (deep-reverse items)) "should have been deep reversed")
)

; run all the tests
(run-registered-tests)

;(run-test '(test0))