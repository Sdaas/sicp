

(define (make-interval a b) (cons a b))

(define (make-center-width c w)
    (make-interval (- c w) (+ c w))
)

(load "ex2-07.scm") ; for defn of upper- and lower-bound selectors

(define (center x)
    ( / (+ (upper-bound x) (lower-bound x)) 2)
)

(define (width x)
       ( / (- (upper-bound x) (lower-bound x)) 2)   
)

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y)))
)

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))

        (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
)


(load "ex2-10.scm")