(load "ex2-34.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

; f(x) = 10  constant
(define-test (test1)
    (define poly (list 10))
    (check (= 10 (horner-eval 0 poly)) "should evalate to 10")
    (check (= 10 (horner-eval -100 poly)) "should evalate to 10")
)

; f(x) = 10 + 3x 
(define-test (test2)
    (define poly (list 10 3))
    (check (= 10 (horner-eval 0 poly)) "should evalate to 10")
    (check (= 40 (horner-eval 10 poly)) "should evalate to 40")
)

; f(x) = -10 + 3x 
(define-test (test3)
    (define poly (list -10 3))
    (check (= -10 (horner-eval 0 poly)) "should evalate to -10")
    (check (= -1 (horner-eval 3 poly)) "should evalate to -1")
)

; f(x) = 7 - 2x + 3x^2 
(define-test (test4)
    (define poly (list 7 -2 3))
    (check (= 7 (horner-eval 0 poly)) "should evalate to 7")
    (check (= 28 (horner-eval 3 poly)) "should evalate to 38")
)

; f(x) = 7 - 2x^2 + x^3 
(define-test (test5)
    (define poly (list 7 0 -2 1))
    (check (= 7 (horner-eval 0 poly)) "should evalate to 7")
    (check (= 16 (horner-eval 3 poly)) "should evalate to 16")
)

; run all the tests
(run-registered-tests)

;(run-test '(test0))