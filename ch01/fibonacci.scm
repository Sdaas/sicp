
; recursive version of fibonacci
(define (fib-recursive x)
    (cond   ( (= x 0 ) 0 )
        ( (= x 1 ) 1)
        ( else ( + (fib-recursive (- x 1)) (fib-recursive (- x 2)))))
)

; the iterative version of fibonacci
(define (fib x)
    (define ( fib-iter f2 f1 n x )
        (define retval (+ f1 f2))
        (if (= n x)
            retval
            (fib-iter f1 retval (+ n 1) x)
        )
    )

    ; do the evaluation
    (cond ( (= x 0 ) 0 )
          ( (= x 1 ) 1 )
          ( else (fib-iter 0 1 2 x))
    )     
)

; Another definition of Fibonacci
; see Exercise 1.13), Fib(n) is the closest integer to φ^n/√5, 
; where φ = ( 1+√5 ) /2 ≈ 1.6180, the golden ratio

(define (fib2 x)
    (define golden_ratio ( / ( + 1 (sqrt 5)) 2))
    (round ( / (expt golden_ratio x) (sqrt 5)))
)
