

; make a mobile out of the (given) left and right branches
(define (make-mobile left right) (list left right))

; get the left-branch of the mobile
(define (left-branch mobile) (car mobile))

; get the right branch of the mobile
(define (right-branch mobile) (car (cdr mobile)))

; make branch. a branch consists of a length and a "structure". The struture may either
; be a number 
(define (make-branch length structure) (list length structure))

; get the length of a branch
(define (branch-length branch) (car branch))

; get the structure part of a branch
(define (branch-structure branch) (car (cdr branch)))

; The total weight under a branch
(define (total-branch-weight branch)
    ; If the branch contains a structure (aka mobile) then compute the total weight of that structure
    ; otherwise it contains a weight and just return the weight
    (define s (branch-structure branch))
    (if (pair? s)
        (+ (total-branch-weight (left-branch s)) (total-branch-weight (right-branch s)))
        s
    )
)

; total of all the weights in a mobile
(define (total-weight mobile)
    (+ (total-branch-weight (left-branch mobile)) (total-branch-weight (right-branch mobile)))
)

;determine if a mobile is balanced or not. In order for a mobile to be balanced
; - the mobile under left branch much be balanced
; - the mobile under right branch must be balanced
; - left branch torque ( length x total weight)  = right branch torque (length x total weight )
(define (balanced? mobile)

    (define (balanced-branch? branch)
        (define s (branch-structure branch))
        (if (pair? s)
            (balanced? s)
            true
        )
    )
    ; compute the torque of a branch
    ; length of the branch * total weight in that branch
    (define (torque branch)
        (* (branch-length branch) (total-branch-weight branch))
    )

    (cond
        ( (not (balanced-branch? (left-branch mobile))) false )
        ( (not (balanced-branch? (right-branch mobile))) false )
        (else (= (torque (left-branch mobile)) (torque (right-branch mobile))))
    )
)



 ;( (1 10) (2 20))
