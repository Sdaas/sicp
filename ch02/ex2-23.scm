
; Note: Scheme has a built-in for-each so this function is called my-for-each

; Take the function f and apply it on each element the list. 
(define (my-for-each f items)
    (if (null? items)
        true
        (begin 
            (f (car items))
            (my-for-each f (cdr items))
        )
    )
)

; Note that if the implementation of my-for-each is just a call to (map f items),
; then the return is a list. This is not the behavior we want - this function can
; return something arbitrary
