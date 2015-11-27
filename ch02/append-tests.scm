(load "append.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (append-test1)
    ; append 10 to the list
    (define x (list 1 2 3))
    (define y (my-append x 10))
    (check (equal? y (list 1 2 3 10)) "The list should have been appended with 10")
)

(define-test (append-test2)
    ; append 100 to the list
    (define x (list 1 2 3 4))
    (define y (my-append x 100))
    (check (equal? y (list 1 2 3 4 100)) "The list should have been appended with 100")
)

; run all the tests
(run-registered-tests)