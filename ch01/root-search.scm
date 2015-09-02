; Section 1.3.3 - Procedure as General Methods
; Finding root of the equation by the half-interval Methods


(define (search f neg-point pos-point)
    (display neg-point)
    (display " ")
    (display pos-point)
    (newline)

    (define mid-point ( / (+ neg-point pos-point) 2))
    (cond
        ( (< (abs (- neg-point pos-point)) 0.00001) neg-point)
        ( (< (f mid-point) 0 ) (search f mid-point pos-point))
        (else (search f neg-point mid-point))
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

; run all the tests
(run-registered-tests)