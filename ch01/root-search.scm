; Section 1.3.3 - Procedure as General Methods
; Finding root of the equation by the half-interval Methods


(define (search f neg-point pos-point)
    (display neg-point)
    (display " ")
    (display pos-point)
    (newline)

    (let ((mid-point ( / (+ neg-point pos-point) 2)))
        (cond
            ( (< (abs (- neg-point pos-point)) 0.00001) neg-point)
            ( (< (f mid-point) 0 ) (search f mid-point pos-point))
            ( else (search f neg-point mid-point))
        )
    )
)

(define (half-interval f a b)
    (let ((fa (f a))  ; f(a)
          (fb (f b))) ; f(b)
        (cond
            ( (and (> fb 0 ) (< fa 0)) (search f a b))
            ( (and (< fb 0 ) (> fa 0)) (search f b a))
            ( else "inputs must be of different signs")
        )
    )
)
; x^3 - 6x^2 + 4x + 12.  Roots at -1.0514, 2.517305, 4.5341
(define (f x)
    (+ ( * x x x) ( * -6 x x) (* 4 x) 12 )
)



; All the unit tests
(load "../test-manager/load.scm")

(in-test-group root-search-tests
    (define tol 0.0001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 2.5173 (search f 4.0 2.0) tol "Expecting 2.5173" )
        (assert-in-delta -1.0514 (search f -2.0 0.0) tol "Expecting -1.0514" )
        (assert-in-delta 4.5341 (search f 4.0 6.0) tol "Expecting 4.5341" )
    )
)

(in-test-group half-interval-tests
    (define tol 0.0001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 2.5173 (half-interval f 2.0 4.0) tol "Expecting 2.5173" )
        (assert-in-delta -1.0514 (half-interval f -2.0 0.0) tol "Expecting -1.0514" )
        (assert-in-delta 4.5341 (half-interval f 6.0 4.0) tol "Expecting 4.5341" )
        (check (string=? "inputs must be of different signs" (half-interval f 0 2.0)))
    )
)

; run all the tests
(run-registered-tests)