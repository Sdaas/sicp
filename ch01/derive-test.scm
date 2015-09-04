(load "derive.scm")

(define (cube x) ( * x x x ))

; define g as the derivative of ube
(define g (derive cube))

; evaluate the derivative at x = 1.0
(g 1.0)