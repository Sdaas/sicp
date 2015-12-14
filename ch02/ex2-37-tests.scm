(load "ex2-37.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(in-test-group transpose-tests

    (define-test (transpose-null-matrix)
        (define empty (list))
        (check (equal? empty (transpose empty)))
    )

    (define-test (transpose-2x3)
        (define m (list (list 1 2 3)
                        (list 4 5 6)))
        (define mt (list (list 1 4)
                        (list 2 5)
                        (list 3 6)))
        (check (equal? mt (transpose m)))
    )

    (define-test (transpose-of-traspose)
        (define m (list (list 1 2 3)
                        (list 4 5 6)))
        (check (equal? m (transpose (transpose m))))
    )

    (define-test (transpose-2x2)
        (define m (list (list 1 2)
                        (list 4 5)))
        (define mt (list (list 1 4)
                        (list 2 5)))
        (check (equal? mt (transpose m)))
    )

    (define-test (transpose-1x4)
        (define m (list (list 1 2 3 4)))
        (define mt (list (list 1)
                        (list 2)
                        (list 3)
                        (list 4)))
        (check (equal? mt (transpose m)))
    )

     (define-test (transpose-4x1)
        (define m (list (list 1)
                        (list 2)
                        (list 3)
                        (list 4)))
        (define mt (list (list 1 2 3 4)))
        (check (equal? mt (transpose m)))
    )
)

(in-test-group first-column-tests
    (define-test (test1)
        (define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
        (define  c1 (list (list 1) (list 4) (list 7)))
        (check (equal? c1 (first-column m)))
    )

    (define-test (vector)
        (define v (list (list 1) (list 4) (list 7)))
        (define  c1 (list (list 1) (list 4) (list 7)))
        (check (equal? c1 (first-column v)))
    )
)

(in-test-group remainder-column-tests
    (define-test (test1)
        (define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
        (define cr (list (list 2 3) (list 5 6) (list 8 9)))
        (check (equal? cr (remainder-columns m)))
    )

    (define-test (vector)
        (define v (list (list 1) (list 4) (list 7)))
        (define  c1 (list))
        (check (equal? c1 (remainder-columns v)))
    )
)

(in-test-group join-columns-tests
    (define-test (test1)
        (define  c1 (list (list 1) (list 4) (list 7))) ; the first column 
        (define cr (list (list 2 3) (list 5 6) (list 8 9))) ; remainder columns
        (define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
        (check (equal? m (join-columns c1 cr)))
    )
)

(in-test-group dot-product-tests
    
    ; Simple dot product - two row vectors
    (define-test (test1)
        (define x (list 1 2 3))
        (define y (list 4 5 6)) 
        (check (= 32 (dot-product x y)))
    )
)

(in-test-group matrix-*-vector-tests
    (define-test (test1)
        (define m (list (list 1 2 3)
                        (list 4 5 6)))
        (define v (list (list 1) (list 2) (list 3))) ; column vector
        (check (equal? (list (list 14) (list 32)) (matrix-*-vector m v)))
    )

    (define-test (test2)
        (define m (list (list 1 2 3)
                    (list 4 5 6)
                    (list 7 8 9)
                    (list 1 2 1)))
        (define v (list (list 1) (list 2) (list 1))) ; column vector
        (check (equal? (list (list 8) (list 20) (list 32) (list 6)) (matrix-*-vector m v)))
    )
)

(in-test-group matrix-multiply-tests
    ; multiply a matrix with the identity matrix
    (define-test (ident-test1)
        (define m (list (list 1 2) (list 4 5)))
        (define eye (list (list 1 0) (list 0 1)))
        (check (equal? m (matrix-*-matrix m eye)))
    )

    ; multiply a matrix with the identity matrix
    (define-test (ident-test2)
        (define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
        (define eye (list (list 1 0 0 ) (list 0 1 0) (list 0 0 1)))
        (check (equal? m (matrix-*-matrix m eye)))
    )

    (define-test (test3)
        (define m (list (list 1 2) (list 4 5)))
        (define n (list (list 5 6) (list 7 8)))
        (define r (list (list 19 22) (list 55 64)))
        (check (equal? r (matrix-*-matrix m n)))
    )

    (define-test (test4)
        (define m (list (list 1 2 3) (list 4 5 6)))
        (define n (list (list 1 3) (list 4 9) (list 6 2)))
        (define r (list (list 27 27) (list 60 69)))
        (check (equal? r (matrix-*-matrix m n)))
    )
)

; run all the tests
(run-registered-tests)
;(run-test '(matrix-*-vector-tests))