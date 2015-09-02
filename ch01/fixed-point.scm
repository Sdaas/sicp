; Find the fixed-point of a function. It is defined as x, s.t.
; f(x) = x

(define (fixed-point f guess)
    (define (average x y) ( / (+ x y) 2))
    (define fg (f guess)) ;
    (define next-guess (average fg guess)) ; 

    (display guess)
    (display " f=")
    (display fg)
    (newline)

    (cond
        (( < (abs (- guess fg)) 0.00001 ) guess )
        (else (fixed-point f next-guess))
    )
)

; y = sqrt(x) => y^2 = x  =>  y = x / y 
(define (mysqrt x)
    (fixed-point  (lambda (y) (/ x y)) 1.0 )
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

(in-test-group sqrt-tests
    (define tol 0.00001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 1.41421 (mysqrt 2.0) tol "sqrt(2)" )
        (assert-in-delta 8.66025 (mysqrt 75.0) tol "sqrt(75)" )
    )
)

; run all the tests
(run-registered-tests)

