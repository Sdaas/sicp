(define (mysqrt2 x) 

    (define (average a b) ( / (+ a b) 2))
    
    ; Formula to compute the next estimate of y
    (define (nexty y) (average y (/ x y)))

    ; We have a good esimate if the current estimate is within 0.1%
    ; of the previous estimate
    (define (isgood yprev y) ( < (/ (abs (- y yprev )) yprev) 0.0001 ))

    (define (sqrt-iteration yprev y)
        (if (isgood yprev y)  y (sqrt-iteration y (nexty y)))
    )
    
    ; Need to be careful here about divide by zeros ...
    ; Evaluate the square root
    (if (= x 0.0) 
        0
        (sqrt-iteration 1 0.1)
    )
)


; All the unit tests
(load "../test-manager/load.scm")


; tests for the mysqrt2 function
(in-test-group msqrt2-tests
    (define tol 0.0001)  ; error tolerance
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (assert-in-delta 0.0000 (mysqrt2 0) tol "sqrt 0" )
        ;(assert-in-delta 0.0000 (mysqrt2 0.000001 ) tol "sqrt 0.0" )
        (assert-in-delta 1.0000 (mysqrt2 1.0 ) tol "sqrt 1" )
        (assert-in-delta 1.41421 (mysqrt2 2.0 ) tol "sqrt 2" )
        (assert-in-delta 10.00000 (mysqrt2 100.0 ) tol "sqrt 10" )
        (assert-in-delta 0.31622 (mysqrt2 0.1 ) tol "sqrt .1" )
        (assert-in-delta 0.1000 (mysqrt2 0.01 ) tol "sqrt .01" )
        (assert-in-delta 0.03162 (mysqrt2 0.001 ) tol "sqrt 0.001" )
    )
)

; run all the tests
(run-registered-tests)