(load "ex2-17.scm") ; to reuse last-pair

; Define a procedure reverse that returns a list of the same elements in the reversed order


(define (append1 list1 n)
    (if (null? list1)
        (list n)
        (cons (car list1) (append1 (cdr list1) n))
    )
)


;reverse a list
(define (reverse1 x)
    (if (null? (cdr x)) ; i.e., if x has only one element
        x
        (append1 (reverse1 (cdr x)) (car x))
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
