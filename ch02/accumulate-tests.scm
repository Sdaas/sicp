(load "accumulate.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; simple test. + operator with 0 as initial value
(define-test (test1)
    (define items (list 1 2 3 4 5))
    (check (= 15 (accumulate + 0 items)) "Accumulator value should be 15")
)

; + operator with non-zero initial value
(define-test (test2)
    (define items (list 1 2 3 4 5))
    (check (= 115 (accumulate + 100 items)) "Accumulator value should be 115")
)

; empty list. + operator with 0 as initial value
(define-test (test3)
    (define items (list))
    (check (= 0 (accumulate + 0 items)) "Accumulator value should be 0")
)

; empty list with non-zero initial value
(define-test (test4)
    (define items (list))
    (check (= 100 (accumulate + 100 items)) "Accumulator value should be 100")
)

; * operator with non-zero initial value
(define-test (test2)
    (define items (list 1 2 3 4 5))
    (check (= 240 (accumulate * 2 items)) "Accumulator value should be 240")
)

; run all the tests
(run-registered-tests)