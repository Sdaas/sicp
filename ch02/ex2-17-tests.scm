(load "ex2-17.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; Comparing lists
; http://sicp.ai.mit.edu/Fall-2003/manuals/scheme-7.5.5/doc/scheme_4.html

(define-test (test1)  
    (define x (list 1 2 3 10))
    (check (equal? (list 10) (last-pair x)) "The list should contain the last element of list")
)

(define-test (test2)  
    (define x (list 1 2 3))
    (check (equal? (list 3) (last-pair x)) "The list should contain the last element of list")
)

(define-test (test3)
    (check (equal? (list 34) (last-pair (list 23 72 149 34))) "The result shoudl contain the last element of the list")
)
; run all the tests
(run-registered-tests)




