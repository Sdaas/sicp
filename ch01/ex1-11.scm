
;A function f is defined by the rule that 
; f(n) = n if n<3,
; f(n)= f(n−1)+2f(n−2)+3f(n−3) if n≥3.
;

; recursive version
(define (frecur x)
    (if (< x 3) x  ( + (frecur (- x 1)) (* 2 (frecur (- x 2))) (* 3 (frecur (- x 3)))))
)

; iterative version
(define (f x)

    (define ( f-iter f3 f2 f1 n x )
        (define retval (+ f1 (* 2 f2) (* 3 f3)) )
        (if (= n x)
            retval
            (f-iter f2 f1 retval (+ n 1) x)
        )
    )

    ; do the evaluation
    (if (< x 3)
        x
        (f-iter 0 1 2 3 x)
    )
)

; f(0)  0
; f(1)  1
; f(2)  2
; f(3)  = f(2) + 2f(1) + 3(f0) = 2 + 2.1 + 3.0 = 4
; f(4)  = f(3) + 2f(2) + 3f(1) = 4 + 2.2 + 3.1 = 4 + 4 + 3 = 11
; f(5)  = f(4) + 2f(3) + 3f(2) = 11 + 2.4 + 3.2 = 11 + 8 + 6 = 25
; f(6)  = f(5) + 2f(4) + 3f(3) = 25 + 2.11 + 3.4 = 25 + 22 + 12 = 59
; f(7)  = f(6) + 2f(5) + 3f(4) = 59 + 2.25 + 3.11 = 59 + 50 + 33 = 142

; All the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-11tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 0 (f 0)) "f(0) should be 0" )
        (check (= 1 (f 1)) "f(1) should be 1" )
        (check (= 2 (f 2)) "f(2) should be 2" )
        (check (= 4 (f 3)) "f(3) should be 4" )
        (check (= 11 (f 4)) "f(4) should be 11" )
        (check (= 25 (f 5)) "f(5) should be 25" )
        (check (= 59 (f 6)) "f(6) should be 59" )
        (check (= 142 (f 7)) "f(7) should be 142" )
    )
)

; run all the tests
(run-registered-tests)