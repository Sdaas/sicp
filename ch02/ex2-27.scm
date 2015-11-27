(load "append.scm")

; deep reverse
(define (deep-reverse items)
    (cond
        ( (null? items) items)
        ( (pair? (car items)) (my-append (deep-reverse (cdr items)) (deep-reverse (car items)))) 
        (else (my-append (deep-reverse (cdr items)) (car items)))
    )   
)
