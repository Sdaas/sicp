(load "sec2-1-4.scm")

; sum_lower = a_lower + b_lower
; sum_higher = a_higher + b_higher
(define (sub-interval x y)
    (make-interval (- (lower-bound x) (lower-bound y))
                   (- (upper-bound x) (upper-bound y)))
)