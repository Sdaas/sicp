
(load "ex2-03a.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (rectangle1)
    (define p1 (make-point 1 2 ))
    (define p2 (make-point 3 4 ))
    (define r1 (make-rectangle p1 p2))
    (check (= (area-rectangle r1) 4) "Area should be 4")
    (check (= (perimeter-rectangle r1) 8) "Area should be 8")
)

(define-test (rectangle2)
    (define p1 (make-point -2 -2 ))
    (define p2 (make-point 3 4 ))
    (define r2 (make-rectangle p1 p2))
    (check (= (area-rectangle r2) 30) "Area should be 30")
    (check (= (perimeter-rectangle r2) 22) "Area should be 22")
)

; run all the tests
(run-registered-tests)


