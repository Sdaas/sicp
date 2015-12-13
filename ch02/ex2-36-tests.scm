(load "ex2-36.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test1)
    (define seqs (list (list 1 2 3) (list 4 5 6)))
    (check (equal? (list 5 7 9) (accumulate-n + 0 seqs)) "Should have been (5 7 9)")
)


; run all the tests
(run-registered-tests)