; Find the fixed-point of a function. It is defined as x, s.t.
; f(x) = x

(define (fixed-point f initial-guess)
    (define (good-enough a b) ( < (abs (- a b)) 0.000001 ))
    (define (try guess)
        (let ((next-guess (f guess)))
            (display guess)
            (newline)
            (if (good-enough guess next-guess)
                guess
                (try next-guess)
            )
        )
    )
    (newline)
    (try initial-guess)
)