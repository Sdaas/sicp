; GCD (a,b) = GCD(b,r) where r = a mod b
(define (gcd a b)
    (if (= 0 b)
        a
        (gcd b (remainder a b))
    )
)
