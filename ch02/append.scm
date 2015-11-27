; Append to the end of the list
(define (my-append list1 n)
    (if (null? list1)
        (list n)
        (cons (car list1) (my-append (cdr list1) n))
    )
)