
; count the number of leaf-nodes in a list. 
; Note that the leaf-count is NOT the same as the length of the list. See SICP 2.2.2
(define (count-leaves items)
    (cond
        ( (null? items) 0)
        ( (pair? (car items)) (+ (count-leaves (car items)) (count-leaves (cdr items))) )
        ( else (+ 1 (count-leaves (cdr items))) )
    )
)