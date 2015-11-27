(load "map.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")


(define-test (test1)
    (define (double x) (* x 2))
    (define data (list 1 2 3 4 5))
    (define expected (list 2 4 6 8 10))
    (check (equal? expected (my-map double data)) "map should have doubled each item in the list")
)

(define-test (test2)
    (define (square x) (* x x))
    (define data (list 1 2 3 4 5))
    (define expected (list 1 4 9 16 25))
    (check (equal? expected (my-map square data)) "map should have squared each item in the list")
)

;edge case on empty list
(define-test (test3)
    (check (null? (my-map square (list ))) "map should have returned empty list")
)

; run all the tests
(run-registered-tests)