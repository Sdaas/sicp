(load "count-leaves.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")


; Simple list (1 2 3 4 5)
(define-test (test1)
    (define items (list 1 2 3 4 5 ))
    (check (= 5 (count-leaves items)) "expected answer to be 5")
)

;  list (1 (2 3 4 5))
(define-test (test2)
    (define items (list 1 (list 2 3 4 5)))
    (check (= 5 (count-leaves items)) "expected answer to be 5")
)

;  list (1 2 (3 4 5))
(define-test (test3)
    (define items (list 1 2 (list 3 4 5)))
    (check (= 5 (count-leaves items)) "expected answer to be 5")
)

;  list (1 (2 3) (4 5))
(define-test (test4)
    (define items (list 1 (list 2 3) (list 4 5)))
    (check (= 5 (count-leaves items)) "expected answer to be 5")
)

;  list ((1 2) (3 4) (5 6)
(define-test (test5)
    (define items (list (list 1 2 ) (list 3 4 ) (list 5 6)))
    (check (= 6 (count-leaves items)) "expected answer to be 10")
)

; empty list
(define-test (test6)
    (define items (list))
    (check (= 0 (count-leaves items)) "expected answer to be 0")
)
; run all the tests
(run-registered-tests)