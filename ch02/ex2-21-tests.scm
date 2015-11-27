(load "ex2-21.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

;test the square-list-1 function
(define-test (test1)
    (define items (list 1 2 10))
    (define expected (list 1 4 100))
    (check (equal? expected (square-list-1 items)) "All items should have been squared using squared-list-1")
)

;test the square-list-2 function
(define-test (test2)
    (define items (list 1 2 10))
    (define expected (list 1 4 100))
    (check (equal? expected (square-list-2 items)) "All items should have been squared using squared-list-2")
)

; run all the tests
(run-registered-tests)