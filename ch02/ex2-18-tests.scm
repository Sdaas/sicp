(load "ex2-18.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (reverse-test1)  
    ; reverse a list of even length
    (define x (list 1 2 3 10))
    (define rx (list 10 3 2 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)

(define-test (reverse-test2)  
    ; reverse a list of odd length
    (define x (list 1 2 3 10 20))
    (define rx (list 20 10 3 2 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)

(define-test (reverse-test3)  
    ; reverse a list of odd length
    (define x (list 1 4 9 16 25))
    (define rx (list 25 16 9 4 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)

; run all the tests
(run-registered-tests)




