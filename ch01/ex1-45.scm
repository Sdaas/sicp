(load "fixed-point.scm")
(load "average-damp.scm")
(load "ex1-43.scm") ; Import the repeated function


; For square root
(define (sqrt x)
    (define (f a)
        (lambda (y) (/ a y))
    )
    ;(fixed-point (f x) 1.0); This will never converge
    (fixed-point (average-damp (f x)) 1.0)
)

; For cube root
(define (cuberoot x)
    (define (f a)
        (lambda (y) (/ a (* y y)))  ; <== See the power of y
    )
    ;(fixed-point (f x) 1.0); This will never converge
    (fixed-point (average-damp (f x)) 1.0)
)

; For the nth root
; This works for n=2 (square root) and n=3 (cube root) but not for higher powers )
(define (nth-root-v1 x n)
    (define (f a)
        (lambda (y) (/ a (expt y (- n 1))))  ; <== See the power of y
    )
    ;(fixed-point (f x) 1.0); This will never converge
    (fixed-point (average-damp (f x)) 1.0)
)


; For the nth root
; Note use of the "repeated" function from 1-43
; We are calling average damp two times
(define (nth-root-v2 x n)
    (define (f a)
        (lambda (y) (/ a (expt y (- n 1))))  ; <== See the power of y
    )
    ;(fixed-point (f x) 1.0); This will never converge
    (fixed-point ((repeated average-damp 2) (f x)) 1.0)
)

; We will note that nth-root-v2 ( where average-damp is called twice) works for all powers up to 7
; We can see from the pattern below that the number of calls is log2(N) to find the nth root
(define (nth-root x n)
    (define (f a)
        (lambda (y) (/ a (expt y (- n 1))))  ; <== See the power of y
    )
    (define calls (floor (/ (log n) (log 2))))  ;
    (fixed-point ((repeated average-damp calls) (f x)) 1.0)
)



; power,   number of times we need to call average-damp
; 2 1
; 3 1
; 4 2
; 5 2
; 6 2
; 7 2
; 8 2 does NOT converge ...
; 9-15 => 3
; 16  3 does not converge
