(load "ex2-19.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")


; make change for 10 using (5,10)
(define-test (test1)
   (define coins (list 5 10))
   (check (= 2 (change 10 coins)) "There should be two ways of making this change")
)

; make change for 10 using (5,10)
; The order of the coins should not matter
(define-test (test1a)
   (define coins (list 10 5))
   (check (= 2 (change 10 coins)) "There should be two ways of making this change")
)

; make change for 5 using (5,10)
(define-test (test2)
   (define coins (list 5 10))
   (check (= 1 (change 5 coins)) "There should be one way of making this change")
)

; make change for 17 using (5,10)
(define-test (test3)
   (define coins (list 5 10))
   (check (= 0 (change 17 coins)) "There should be no way of making this change")
)

; make change for 11 using (1,10)
(define-test (test4)
   (define coins (list 1 10))
   (check (= 2 (change 11 coins)) "There should be 2 way of making this change")
)

; make change for 100 using all the US coins
(define-test (test5)
   (define coins (list 1 5 10 25 50))
   (check (= 292 (change 100 coins)) "There should be 292 way of making this change")
)

; make change for 100 using all the US coins.
; The order of the coins should not matter
(define-test (test5a)
   (define coins (list 5 1 50 10 25))
   (check (= 292 (change 100 coins)) "There should be 292 way of making this change")
)

; run all the tests
(run-registered-tests)




