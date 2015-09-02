; The sum of squares of  prime numbers in the range a .. b 

(load "prime1.scm") ; for prime?
(load "ex1-33.scm") ; for filtered-accumulate


; The sum of squares of  prime numbers in the range a .. b 
; Note that prime? is loaded from prime1.scm
(define (f a b)
    (define (square x) ( * x x ))
    (define (inc x) (+ x 1))
    (filtered-accumulate prime? + 0 square a inc b )
)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group f-tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= 1 (f 1 1)) "1" )
        (check (= 14 (f 1 4)) "1^2 + 2^2 + 3^2 = 14" )
        (check (= 195 (f 4 11)) "5^2 + 7^2 + 11^2 = 195" )
        (check (= 195 (f 5 12)) "5^2 + 7^2 + 11^2 = 195" )
    )
)

; run all the tests
(run-registered-tests)
