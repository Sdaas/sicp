(load "filter.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")


(define-test (test1)
    ;(define (odd? x) (= 1 (remainder x 2)))  turns out odd? is a built-in function
    (define data (list 1 2 3 4 5))
    (define expected (list 1 3 5))
    (check (equal? expected (my-filter odd? data)) "should have filtered the odd numbers")
)

(define-test (test2)
    (define data (list 2 4 6))
    (check (null? (my-filter odd? data)) "should have returned an empty list")
)

;edge case on empty list
(define-test (test3)
    (check (null? (my-filter odd? (list ))) "map should have returned empty list")
)

; run all the tests
(run-registered-tests)