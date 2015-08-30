; Multiply a and b
; Iterative multiplicaiton procedure. Order log n
(define (fast-mult a b)

    ; helper
    (define (double x) (+ x x))
    (define (halve x) ( / x 2))
    
    ; we will manipulate so that k + a*b remains constant. In each iteration
    ; we wil attempt to reduce b by half. If b is even then k + (2a)(b/2)
    ; else a + a*(b-1)
    (define (iter k a b)
        ( cond ( (= b 0 ) k )
            ( (= a 0 ) k)
            ( (even? b) (iter k (double a) (halve b)))
            ( else (iter (+ k a) a (- b 1)))
        )
    )
    ; Evaluate
    (iter 0 a b)
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-18tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 0 (fast-mult 2 0)) "2*0 = 0 " )
        (check (= 0 (fast-mult 0 2)) "0*2 " )
        (check (= 10 (fast-mult 10 1)) "10*1 " )
        (check (= 10 (fast-mult 1 10)) "1*10" )
        (check (= (* 17 34) (fast-mult 17 34)) "17*34" )
        (check (= (* 19 17) (fast-mult 19 17)) "17*19" )
        (check (= (* 16 16) (fast-mult 16 16)) "16*16" )
        (check (= (* 18 20) (fast-mult 18 20)) "18*20" )
    )
)

; run all the tests
(run-registered-tests)