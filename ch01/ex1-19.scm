; Fibonacci
(define (fibo n)
    (define (tee p q a b n)
    
        (define pdash ( + (* p p ) (* q q )))  ; pdash = p^2 + q^2
        (define qdash ( + (* q q ) (* 2 p q))) ; qdash = q^2 + 2pq
        (define newa ( + (* b q) (* a q) (* a p)))
        (define newb ( + (* b p) (* a q) ))

        (cond ((= 0 n) b)
            ( (even? n) (tee pdash qdash a b (/ n 2)))
            (else ( tee p q newa newb (- n 1)))
        )
    )

    ; do the evaluation
    (tee 0 1 1 0 n)
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-19tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 0 (fibo 0)) "f(0)" )
        (check (= 1 (fibo 1)) "f(1)" )
        (check (= 1 (fibo 2)) "f(2)" )
        (check (= 2 (fibo 3)) "f(3)" )
        (check (= 3 (fibo 4)) "f(4)" )
        (check (= 5 (fibo 5)) "f(5)" )
        (check (= 8 (fibo 6)) "f(6)" )
        (check (= 13 (fibo 7)) "f(7)" )
        (check (= 21 (fibo 8)) "f(8)" )
        (check (= 34 (fibo 9)) "f(9)" )
        (check (= 55 (fibo 10)) "f(10)" )
        (check (= 89 (fibo 11)) "f(11)" )
        (check (= 144 (fibo 12)) "f(12)" )
        (check (= 233 (fibo 13)) "f(13)" )
        (check (= 377 (fibo 14)) "f(14)" )
        (check (= 610 (fibo 15)) "f(15)" )
    )
)

 



; run all the tests
(run-registered-tests)