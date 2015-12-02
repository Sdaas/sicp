(load "ex2-33.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(in-test-group map-tests
    
    (define-test (test1)  
        (define items (list 1 2 3 4 5))
        (define (double x) (* x 2))
        (define expected (list 2 4 6 8 10))
        (check (equal? expected (map33 double items)))
    )

    (define-test (test2)  
        (define items (list 10))
        (define (double x) (* x 2))
        (define expected (list))
        (check (equal? expected (map33 double items)))
    )

    (define-test (test2)  
        (define empty (list))
        (define (double x) (* x 2))
        (check (equal? empty (map33 double empty)))
    )
)

(in-test-group append-tests

    ; append two lists
    (define-test (test1)
        (define a (list 1 2 3))
        (define b (list 4 5 6 7 8 ))
        (define expected (list 1 2 3 4 5 6 7 8 ))
        (check (equal? expected (append33 a b)))
    )

    ; append an empty list
    (define-test (test2)
        (define a (list 1 2 3))
        (define b (list))
        (define expected (list 1 2 3))
        (check (equal? expected (append33 a b)))
    )

    ; append to an empty list
    (define-test (test3)
        (define a (list))
        (define b (list 4 5 6))
        (define expected (list 4 5 6))
        (check (equal? expected (append33 a b)))
    )

    ; append an empty list to an empty list
    (define-test (test3)
        (define empty (list))
        (check (equal? empty (append33 empty empty)))
    )
)

(in-test-group length-tests
    ; length of empty list
    (define-test (test1)
        (define empty (list))
        (check (= 0 (length33 empty)))
    )

    ; length of a non-empty list
    (define-test (test2)
        (define a (list 1 2 3 4 5))
        (check (= 5 (length33 a)))
    )

    ; length of a non-empty list
    (define-test (test3)
        (define a (list 1 (list 2 3) (list 4 5) ))
        (check (= 3 (length33 a)))
    )
)
; run all the tests
(run-registered-tests)

;(run-test '(test0))