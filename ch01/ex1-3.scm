; Define a procedure that takes three numbers as 
; arguments and returns the sum of the squares 
; of the two larger numbers.

(define (sumofsquares x y) ( + (* x x ) (* y y)))
(define (myfunc a b c) 
        (cond
            ( (and (<= a b) (<= a c)) (sumofsquares b c))
            ( (and (<= b a) (<= b c)) (sumofsquares a c))
            ( (and (<= c a) (<= c b)) (sumofsquares a b))
        )
)

; Interesting test conditions
; 1 1 1
; 1 2 2
; 1 1 2