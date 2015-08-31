(load "prime1.scm")

(define (timed-prime-test n)
    (start-prime-test n (runtime))
)

; Read TFA http://stackoverflow.com/questions/1144106/about-if-in-scheme-plt-scheme
(define (start-prime-test n start-time)
    (if (prime? n)
        ( begin
            (report-prime n (- (runtime) start-time))
            true
        )
        false
    )
)

(define (report-prime n elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time)
)

; search for the n smallest prime numbers greater than "start"
(define (search-for-primes n start)
    (if (> n 0)
        (if (timed-prime-test start)
            (search-for-primes (- n 1) (+ start 2))
            (search-for-primes n (+ start 1))
        )
    ) 
)

; Try at start values of 10^6, 10^7, and 10^8 to get any meaningful results
