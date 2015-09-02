; Find the fixed-point of a function. It is defined as x, s.t.
; f(x) = x

(define (fixed-point f guess)
    (define next (f guess)) ; This will be the next guess if needed
    (display guess)
    (display " f=")
    (display next)
    (newline)

    (cond
        (( < (abs (- guess next)) 0.00001 ) guess )
        (else (fixed-point f next))
    )
)

; All the unit tests
(load "../test-manager/load.scm")

(in-test-group fixed-point-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 0.73908 (fixed-point cos 1.0) tol "cos(x)" )
        (assert-in-delta 1.25873 (fixed-point (lambda (x) (+ (cos x) (sin x))) 1.0 ) tol "cos(x) + sin(x)" )
    )
)

; run all the tests
(run-registered-tests)


