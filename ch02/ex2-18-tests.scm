(load "ex2-18.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; reverse a list of even length
(define-test (test1)  
    (define x (list 1 2 3 10))
    (define rx (list 10 3 2 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)

; reverse a list of odd length
(define-test (test2)  
    (define x (list 1 2 3 10 20))
    (define rx (list 20 10 3 2 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)
    
; reverse a list of odd length
(define-test (test3)  

    (define x (list 1 4 9 16 25))
    (define rx (list 25 16 9 4 1))
    (check (equal? rx (reverse1 x)) "The list should be reversed")
)

; reverse a list of one element
(define-test (test4)  
    (define items (list 1))
    (check (equal? items (reverse1 items)) "The list should be reversed")
)

; reverse a empty list
(define-test (test5)  
    (define items (list))
    (check (equal? items (reverse1 items)) "The list should be reversed")
)

; reverse a list that contains lists
(define-test (test6)  
    (define items (list 1 (list 2 3) 4))
    (define expected (list 4 (list 2 3) 1))
    (check (equal? expected (reverse1 items)) "The list should be reversed")
)

; reverse a list that contains lists
(define-test (test7)  
    (define items (list (list 1 2) 3 4))
    (define expected (list 4 3 (list 1 2)))
    (check (equal? expected (reverse1 items)) "The list should be reversed")
)

; reverse a list that contains lists
(define-test (test8)  
    (define items (list 1 2 (list 3 4)))
    (define expected (list (list 3 4) 2 1))
    (check (equal? expected (reverse1 items)) "The list should be reversed")
)

; run all the tests
(run-registered-tests)




