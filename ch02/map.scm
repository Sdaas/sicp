; The classic map function. 

; Apply the function f on each element of the list x
; BTW, scheme already has a map function, so we call this my-map
(define (my-map f x)
    (if (null? x)
        x
        (cons (f (car x)) (my-map f (cdr x)))
    )
)

;Remember that (cons n x)  can be used to append the list 
; x to the number n. However, (cons x n) will just lead to the creation of a pair 
; that contains x and n