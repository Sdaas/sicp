(load "ex2-28.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; empty list
(define-test (test0)
    (define empty (list))
    (check (equal? empty (fringe empty)) "should return an empty list")
)

; list of numbers
(define-test (test1)
    (define items (list 1 2 3 4 5))
    (define expected (list 1 2 3 4 5))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4 5")
)

; list of just one number
(define-test (test1a)
    (define items (list 1))
    (define expected (list 1))
    (check (equal? expected (fringe items)) "should have returned 1")
)

; list followed by numbers
(define-test (test2)
    (define items (list (list 1 2) 3 4))
    (define expected (list 1 2 3 4))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4")
)

; single list entry
(define-test (test3)
    (define items (list (list 1 2)))
    (define expected (list 1 2 ))
    (check (equal? expected (fringe items)) "should have returned 1 2")
)

; number followed by list
(define-test (test4)
    (define items (list 1 2 (list 3 4)))
    (define expected (list 1 2 3 4))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4")
)

; list of lists
(define-test (test5)
    (define items (list (list 1 2) (list 3 4)))
    (define expected (list 1 2 3 4))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4")
)

; list of lists
(define-test (test6)
    (define items (list (list 1 2) (list 3 4) (list 5 6)))
    (define expected (list 1 2 3 4 5 6))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4 5 6")
)

; nested lists
(define-test (test7)
    (define items (list (list 1 2) 3 (list (list 4 5) 6)))
    (define expected (list 1 2 3 4 5 6))
    (check (equal? expected (fringe items)) "should have returned 1 2 3 4 5 6")
)

; run all the tests
(run-registered-tests)

;(run-test '(test0))