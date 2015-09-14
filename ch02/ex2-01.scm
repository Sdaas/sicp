(load "../ch01/gcd.scm")

; make a rational number
(define (make-rat num den)

    ; TODO handling of 0 in num and/or denom
    (define g (gcd num den))
    (if (= 1 g)
        ; num and denom are mutually prime, so just handle the signs
        (cond
            ((and (>= num 0) (> den 0)) (cons num den))
            ((and (< num 0) (> den 0)) (cons  num den))
            ( else (cons (- num) (- den)))
        )
        ; make a rational number after divding by the hcf
        (make-rat (/ num g) (/ den g))
    )
    
    
)

(define (numer rat) (car rat))
(define (denom rat) (cdr rat))