
(load "ex2-03a.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; define a rectangle using opposite vertices and mesure its area and perimeter
(define-test (rectangle1)
    (define p1 (make-point 1 2 ))
    (define p2 (make-point 3 4 ))
    (define r1 (make-rectangle p1 p2))
    (check (= (area-rectangle r1) 4) "Area should be 4")
    (check (= (perimeter-rectangle r1) 8) "Perimeter should be 8")
)

; define a rectangle using opposite vertices and mesure its area and perimeter
(define-test (rectangle2)
    (define p1 (make-point -2 -2 ))
    (define p2 (make-point 3 4 ))
    (define r2 (make-rectangle p1 p2))
    (check (= (area-rectangle r2) 30) "Area should be 30")
    (check (= (perimeter-rectangle r2) 22) "Perimeter should be 22")
)

; define a rectangle using one vertice, height, and width
(define-test (rectangle3)
    (define p1 (make-point 1 2 ))
    (define r1 (make-rectangle2 p1 10 20))
    (check (= (area-rectangle r1) 200) "Area should be 200")
    (check (= (perimeter-rectangle r1) 60) "Perimeter should be 60")
)

; define a rectangle using one vertice, height, and width
(define-test (rectangle4)
    (define p1 (make-point -2 -2 ))
    (define r2 (make-rectangle2 p1 3 7))
    (check (= (area-rectangle r2) 21) "Area should be 21")
    (check (= (perimeter-rectangle r2) 20) "Perimeter should be 20")
)

; run all the tests
(run-registered-tests)


