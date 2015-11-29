(load "ex2-31.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; empty tree
(define-test (test0)
    (define empty (list))
    (check (equal? empty (square-tree empty)) "should return an empty list")
)

; simple tree of numbers
(define-test (test1)
    (define items (list 1 2 3 4 5))
    (define expected (list 1 4 9 16 25))
    (check (equal? expected (square-tree items)) "should have returned 1 4 9 16 25")
)

; tree of just one node
(define-test (test1a)
    (define items (list 10))
    (define expected (list 100))
    (check (equal? expected (square-tree items)) "should have returned 100")
)

; list followed by numbers
(define-test (test2)
    (define items (list (list 1 2) 3 4))
    (define expected (list (list 1 4) 9 16))
    (check (equal? expected (square-tree items)) "should have returned (list (list 1 4) 9 16)")
)

; single list entry
(define-test (test3)
    (define items (list (list 5 6)))
    (define expected (list (list 25 36)))
    (check (equal? expected (square-tree items)) "should have returned (list (list 25 36))")
)

; number followed by list
(define-test (test4)
    (define items (list 1 2 (list 3 4)))
    (define expected (list 1 4 (list 9 16)))
    (check (equal? expected (square-tree items)) "should have returned (list 1 4 (list 9 16))")
)

; list of lists
(define-test (test5)
    (define items (list (list 1 2) (list 3 4)))
    (define expected (list (list 1 4) (list 9 16)))
    (check (equal? expected (square-tree items)) "should have returned list (list 1 4) (list 9 16))")
)

; list of lists
(define-test (test6)
    (define items (list (list 1 2) (list 3 4) (list 5 6)))
    (define expected (list (list 1 4) (list 9 16) (list 25 36)))
    (check (equal? expected (square-tree items)) "should have returned (list (list 1 2) (list 9 16) (list 25 36))")
)

; nested lists
(define-test (test7)
    (define items (list (list 1 2) 3 (list (list 4 5) 6)))
    (define expected (list (list 1 4) 9 (list (list 16 25) 36)))
    (check (equal? expected (square-tree items)) "should have returned (list (list 1 4) 9 (list (list 16 25) 36))")
)

; run all the tests
(run-registered-tests)

;(run-test '(test2))

