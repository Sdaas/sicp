; To compute the derivate
; See Section 1.3.4

; evaluate the derviative of the function f
(define (derive f)
    (define dx 0.00001)
    (lambda (x)
        ( / (- (f (+ x dx)) (f x) ) dx )
    )
)

