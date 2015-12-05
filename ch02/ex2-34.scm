(load "accumulate.scm")

; Evaluate the specificed polynomial at the value xval
; The list (a0 a1 a2 .. an) corresponds to the polynomial a0 + a1*x + a2*x^2 + .... an*x^n
(define (horner-eval x coeff-sequence)
    (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
        0
        coeff-sequence
    )
)

; The core of accumulate looks like
;    (if (null? items)
;        init-value
;        (oper (car items) (accumulate oper init-value (cdr items)))
;    )
;
; a0 + a1.x^1 + a2.x^2 + a3.x^3
; a0 + x ( a1 + a2.x + a3.x^2 ) 
; 
; This is basically + (car items) * ( x (accum (cdr items)))
; 