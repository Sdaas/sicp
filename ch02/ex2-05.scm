; Represent a pair of numbers (a,b) in the form 2^a.3^b

(define (make-pair a b)
    ( * (expt 2 a) (expt 3 b))
)

; get the number that is expressed as 2^
(define (first-number x) (log x 2))

; get the number that is expressed as 3^
(define (second-number x) (log x 3))

; log of n to the base b. Return x such that b^x = n
(define (log n b)
    (define (inner n b count)
        (if (= (modulo n b) 0)
            (inner (/ n b) b (+ count 1))
            count
        )
    )
    (inner n b 0)
)
