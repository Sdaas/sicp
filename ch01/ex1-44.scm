(load "ex1-43.scm") ; reusing "repeated"

(define (smooth f dx)
    (lambda (x) 
        ( / ( + (f (+ x dx)) (f x) (f (- x dx))) 3 )
    )
)

(define (repeated-smooth f n dx)
    (repeated ( smooth f dx ) n )
)
