(load "tree-map.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define (double x) (* x 2))

; empty tree
(define-test (test0)
    (define empty (list))
    (check (equal? empty (tree-map double empty)) "should return an empty list")
)

; simple tree of numbers
(define-test (test1)
    (define items (list 1 2 3 4 5))
    (define expected (list 2 4 6 8 10))
    (check (equal? expected (tree-map double items)) "should have returned 2 4 6 8 10")
)

; tree of just one node
(define-test (test1a)
    (define items (list 10))
    (define expected (list 20))
    (check (equal? expected (tree-map double items)) "should have returned 20")
)

; list followed by numbers
(define-test (test2)
    (define items (list (list 1 2) 3 4))
    (define expected (list (list 2 4) 6 8))
    (check (equal? expected (tree-map double items)) "should have returned (list (list 2 4) 6 8)")
)

; single list entry
(define-test (test3)
    (define items (list (list 5 6)))
    (define expected (list (list 10 12)))
    (check (equal? expected (tree-map double items)) "should have returned (list (list 10 12))")
)

; number followed by list
(define-test (test4)
    (define items (list 1 2 (list 3 4)))
    (define expected (list 2 4 (list 6 8)))
    (check (equal? expected (tree-map double items)) "should have returned (list 2 4 (list 6 8))")
)

; list of lists
(define-test (test5)
    (define items (list (list 1 2) (list 5 6)))
    (define expected (list (list 2 4) (list 10 12)))
    (check (equal? expected (tree-map double items)) "should have returned (list (list 2 4) (list 10 12))")
)

; list of lists
(define-test (test6)
    (define items (list (list 1 2) (list 3 4) (list 5 6)))
    (define expected (list (list 2 4) (list 6 8) (list 10 12)))
    (check (equal? expected (tree-map double items)) "should have returned (list (list 2 4) (list 6 8) (list 10 12))")
)
; nested lists
(define-test (test7)
    (define items (list (list 1 2) 3 (list (list 4 5) 6)))
    (define expected (list (list 2 4) 6 (list (list 8 10) 12)))
    (check (equal? expected (tree-map double items)) "should have returned (list (list 2 4) 6 (list (list 8 10) 12))")
)

; run all the tests
(run-registered-tests)

;(run-test '(test2))

