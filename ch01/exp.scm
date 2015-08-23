; (exp x n)  raise x to the power n

(define (exp x n)
    (define (square x) (* x x))
    (cond ( (= n 0) 1)
        ( (= n 1) x)
        ( (odd? n) (* x (exp x (- n 1))) )
        ( else ( square (exp x (/ n 2))) )
    )
)
