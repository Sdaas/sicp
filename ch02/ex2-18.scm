(load "ex2-17.scm") ; to reuse last-pair
(load "append.scm") ; defines a function to append a number to the end of the list

; Define a procedure reverse that returns a list of the same elements in the reversed order

;reverse a list
(define (reverse1 x)
    (if (null? (cdr x)) ; i.e., if x has only one element
        x
        (my-append (reverse1 (cdr x)) (car x))
    )
)

;A reverse( 1 2 3 4 )
;B reverse( 2 3 4) 1
;
; The problem is - how to append the list returned by the call to reverse() in step
; B with a single number. Remember that (cons n x)  can be used to append the list 
; x to the number n. However, (cons x n) will just lead to the creation of a pair 
; that contains x and n
;
