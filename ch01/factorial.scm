
; computes factorial

(define (factorial x)
    (if (< x 2 ) 1 ( * x (factorial (- x 1))))
)