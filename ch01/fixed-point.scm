; Find the fixed-point of a function. It is defined as x, s.t.
; f(x) = x

(define (fixed-point f guess)
    (display guess)
    (display " f=")
    (display (f guess))
    (newline)
    (cond
        (( < (abs (- guess (f guess))) 0.00001 ) guess )
        (else (fixed-point f (f guess)))
    )
)

