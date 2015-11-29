

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

(define (total-weight0000 mobile)
    (define lbs (branch-structure (left-branch mobile)))
    (define rbs (branch-structure (right-branch mobile)))
    (cond
        ((null? mobile) 0)
        ((not (pair? rbs)) rbs)   ; right branch is not a structure/mobile
        ((not (pair? lbs)) lbs)   ; left branch is not a structure/mobile
        (else (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile))))
    )
)

(define (total-weight mobile)

    (define (total-branch-weight branch)
        ; If the branch contains a structure (aka mobile) then compute the total weight of that mobile
        ; otherwise it contains a weight and just return the weight
        (define s (branch-structure branch))
        (if (pair? s)
            (total-weight s)
            s
        )
    )

    (if (null? mobile)
        0
        (+ (total-branch-weight (left-branch mobile)) (total-branch-weight (right-branch mobile)))
    )
)

; ((1 10) (2 20))  
; ((1 ((5 6) (10 15))) (2 ((1 5) (2 7))))