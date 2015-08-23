
; recursive version of fibonacci
(define (fib-recursive x)
    (cond   ( (= x 0 ) 0 )
        ( (= x 1 ) 1)
        ( else ( + (fib-recursive (- x 1)) (fib-recursive (- x 2)))))
)

; the iterative version of fibonacci
(define (fib x)
    (define ( fib-iter f2 f1 n x )
        (if (= n x)
            (+ f1 f2)
            (fib-iter f1 (+ f2 f1) (+ n 1) x)
        )
    )

    ; do the evaluation
    (cond ( (= x 0 ) 0 )
          ( (= x 1 ) 1 )
          ( else (fib-iter 0 1 2 x))
    )     
)

