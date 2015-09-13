; iterative-improve
; good-enough : two params. determines if the guess is good enough
; improve guess : an algorithm to determine the next guess
; returns a procedure, whcih when called with the initial guess will iterratively improve
(define (iterative-improve good-enough improve-guess)
    (define (iter current-guess)
        (let ((next-guess (improve-guess current-guess)))
            (display current-guess)
            (newline)
            (if (good-enough current-guess next-guess)
                current-guess
                (iter next-guess)
            )
        )
    )
    iter ; return the procedure iter
)

; Note that we cannot use a lambda here, because we need to call this same 
; procedure iteratively