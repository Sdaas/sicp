; return a function that represents a pair
(define (my-cons a b)
    (lambda (f) (f a b))
)

; get the first element of the pair. remember that f is a function
(define (my-car f)
    (f (lambda (a b) a))
)

(define (my-cdr f)
    (f (lambda (a b) b))
)