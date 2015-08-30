; recursive multplication

(define (fast-mult a b)
    (define (double x) (+ x x ))
    (define (halve x) ( / x 2))
    (cond ( (= a 0 ) 0)
        ( (= b 0 ) 0 )
        ( (= b 1 ) a )
        ( (even? b) (fast-mult (double a) (halve b)) )   ; (a*2) * (b/2)
        ( else (+ a (fast-mult a (- b 1))))  ; a + a*(b-1)
    )
)



; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-17tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 0 (fast-mult 2 0)) "2*0 = 0 " )
        (check (= 0 (fast-mult 0 2)) "2*0 = 0 " )
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