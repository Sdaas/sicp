; Find the fixed-point of a function. It is defined as x, s.t.
; f(x) = x

(define (fixed-point f guess)
    (define (average x y) ( / (+ x y) 2))
    (define fg (f guess)) ;
    (define next-guess (average fg guess)) ; 

    (display guess)
    (display " f=")
    (display fg)
    (newline)

    (cond
        (( < (abs (- guess fg)) 0.00001 ) guess )
        (else (fixed-point f next-guess))
    )
)



