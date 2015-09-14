
; make a rational number
(define (make-rat num den)

    ; TODO handling of 0 in num and/or denom
    (cond
        ((and (>= num 0) (> den 0)) (cons num den))
        ((and (< num 0) (> den 0)) (cons  num den))
        ( else (cons (- num) (- den)))
    )
)

(define (numer rat) (car rat))
(define (denom rat) (cdr rat))