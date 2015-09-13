(load "ex1-46.scm") ; load the definition of iterative improve


(define (mysqrt n)

    (define (average a b) ( / (+ a b) 2))

    ; A way to determine if the guess is good enough
    ; In this implementation, we check if the two guesses are within 0.01% of each other
    (define (good-enough? a b) (< (/ (abs (- b a)) a ) 0.0001))

    ; A way to compute the next-guess. For the sqrt function, 
    ; the next guess is given by
    (define (next-guess current-guess) (average current-guess (/ n current-guess)))

    (define iter (iterative-improve good-enough? next-guess))
    ; Find the iterative solution, starting from an initial guess
    (iter 1.0)
)