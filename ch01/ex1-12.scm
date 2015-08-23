; Pascal's triangle

; Evaluate the value of Pascal's triangle at row n, column i
(define (pascal n i)
    (cond ((> i n ) "error")
        ( (= i 1 ) 1)
        ( (= i n ) 1)
        (else (+ (pascal (- n 1) (- i 1)) (pascal (- n 1) i))))
)