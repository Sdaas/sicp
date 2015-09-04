; 1.3.4 Procedures as returned values
(load "fixed-point.scm")
(load "derive.scm")

(define (newtons-method f guess)
    (fixed-point
        (lambda (x) ( - x ( / (f x) ((derive f) x))))
        guess 
    )
)
; Suppose f(x) = (x-3)*(x+2)
; Then the fixed point of  x - f(x)/f'(x) gives the root of f(x)
(define (f x ) 
    (* (- x 3) (+ x 2))
)