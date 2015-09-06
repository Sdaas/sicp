;Find the solution to x^x = 1000
; x log(x) = log(1000)
; x = log(1000) / log(x)     

(load "fixed-point.scm")
(load "average-damp.scm"); 

; Simple solution to xtox - no average damping used
(define (solve-xtox-v1 x)
    (define (f a)
        (lambda (y) (/ (log a) (log y)))
    )
    (fixed-point (f x) 2.0) ; cant start from 1 since log(1) = 0
)

; Using average damp. Note that this solution converges must faster
(define (solve-xtox x)
    (define (f a)
        (lambda (y) (/ (log a) (log y)))
    )
    (fixed-point (average-damp (f x)) 2.0) ; cant start from 1 since log(1) = 0
)

(solve-xtox 1000)

