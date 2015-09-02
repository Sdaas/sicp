;Find the solution to x^x = 1000
; x log(x) = log(1000)
; x = log(1000) / log(x)     

(load "fixed-point.scm")

; The golden point is the fixed point of f(x) = 1 + 1/x
(define (solve-xtox= n)
    (fixed-point (lambda (x) (/ (log n) (log x))) 2.0) ; cant start from 1 since log(1) = 0
)

(solve-xtox= 1000)

