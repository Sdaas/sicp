;Alyssa P. Hacker doesn’t see why if needs to be
;provided as a special form. “Why can’t I just define 
;it as an ordinary procedure in terms of cond?” she asks.
;
(define (new-if predicate then-clause else-clause) 
    (cond (predicate then-clause)
          (else else-clause))
)

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.1)
)

(define (sqrt-iter guess x) 
        (new-if (good-enough? guess x)
                guess
                (sqrt-iter (improve guess x) x))
)

(define (my-sqrt x)
    (sqrt-iter 1 x)
)

; This does into an Infinite loop. For the following
; reason - new-if is a function. For a function, Scheme
; evaluates all the arguments to the function before
; executing the body of the function.
;
; Also see
; http://stackoverflow.com/questions/1171252/whats-the-explanation-for-exercise-1-6-in-sicp

