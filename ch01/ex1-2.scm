; Translate the following into prefix
;  5+4+(2−(3−(6 + 4/5)))    14.8
;  --------------------- = ----
;  3(6 − 2)(2 − 7)          -60

(define num (+ 4 5 (- 2 (- 3 (+ 6 (/ 4 5))))))
(define den (* 3 (- 6 2) (- 2 7) ))
(/ num den)

; Define all the unit tests
(load "../test-manager/load.scm")

(in-test-group ex1-2tests
    ; Each of these will become a separate anonymous one-form test
    (define-each-test
        (check (= -37/150 (/ num den)) "should be -37/150" )
    )
)

; run all the tests
(run-registered-tests)