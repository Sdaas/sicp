; Golden Ratio
;
; In section 1.2.2.  phi = ( 1 + sqrt(5) ) / 2

(load "fixed-point.scm")

; The golden point is the fixed point of f(x) = 1 + 1/x
(define (golden-ratio)
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
)

(define (golden-ratio2)
    ( / ( + 1 (sqrt 5)) 2 )
)

; All the unit tests
(load "../test-manager/load.scm")

(in-test-group sqrt-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta (golden-ratio) (golden-ratio2) tol "golden-ratio" )
    )
)

; run all the tests
(run-registered-tests)