; Definite Integral 
(load "sum.scm")

; f( a + dx/2) + ....  a <- a+dx
(define (integral f a b dx)
    (define (next x) (+ x dx))
    (* dx (sum f (+ a ( / dx 2.0)) next b))
)

; Integral of x^3 from 0 to 1 = 0.25
(define (cube x) ( * x x x))
(integral cube 0 1 0.001)

; Integral of x^2 from 0 .. 10 = 333.333
; http://www.wolframalpha.com/input/?i=integrate+x%5E2+dx+from+x%3D0+to+10
(define (fofx x) (* x x))
(integral fofx 0 10 0.01)