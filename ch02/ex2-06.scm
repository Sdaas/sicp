
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x))))
)

; What is one ? 
; Consider  ((n f) x)
; The function n is invoked with the parameter f, the the result (which is also a function)
; is invoked with the parameter x. 
; Substituting n="zero" in (n f), this returns (lambda (x) x), which BTW is the identity function
; Invoking (lambda (x) x) with x, evaluates to x
; So (( n f) x)) evaluated for n="zero" evaluates to (x)
; So add-1 n for n="zero" evaluates to
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))