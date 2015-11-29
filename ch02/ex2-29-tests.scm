(load "ex2-29.scm")

; Load the unit testing framework
(load "../test-manager/load.scm")

(in-test-group basic-tests
    ; Create the branch with length and number, and check their numbers
    (define-test (test1)  
        (define branch (make-branch 1 10))    
        (check (= 1 (branch-length branch)) "should return a branch length of 1")
        (check (= 10 (branch-structure branch)) "should return a branch structure of 10")
    )

    ; Create a degenerate mobile and check the getters
    (define-test (test2a)  
        (define mobile (make-mobile 100 200))    
        (check (= 100 (left-branch mobile)) "should have returned 100 for left branch")
        (check (= 200 (right-branch mobile)) "should have returned 200 for right branch") 
        ;(check (= 30 (total-weight mobile)) "expected weight is 30")
    )

    ; Create a mobile and check the getters
    (define-test (test2b)  
        (define lb (make-branch 1 10))
        (define rb (make-branch 2 20))
        (define mobile (make-mobile lb rb))
        
        (check (equal? lb (left-branch mobile)) "should have returned the left branch")
        (check (equal? rb (right-branch mobile)) "should have returned the left branch") 
        ;(check (= 30 (total-weight mobile)) "expected weight is 30")
    )

    ; Create the branch with length and a mobile, and check the getters 
    (define-test (test3b)  
        (define simple-mobile (make-mobile (make-branch 1 10) (make-branch 2 20)))
        (define branch (make-branch 5 simple-mobile))    
        (check (= 5 (branch-length branch)) "should return a branch length of 1")
        (check (equal? simple-mobile(branch-structure branch)) "the branch structure should be the simple-mobile")
    )
)

(in-test-group weight-tests
    ; create a simple mobile. Left branch has a length of 1 and weight 10. And right
    ; branch has length and weight 20. Represented as ((1 10) (2 20))
    (define-test (weight-test1)  
        (define lb (make-branch 1 10))
        (define rb(make-branch 2 20))
        (define mobile (make-mobile lb rb))
        
        (check (= 30 (total-weight mobile)) "expected weight is 30")
    )

    ; Tree where right branch contains an additional level  ((1 10) (2 ((1 5) (2 7))))
    (define-test (weight-test2)  
        (define lb (make-branch 1 10))
        (define rb (make-branch 2 (make-mobile (make-branch 1 5) (make-branch 2 7))))
        (define mobile (make-mobile lb rb))
        
        (check (= 22 (total-weight mobile)) "expected weight is 22")
    )

    ; Tree where both contains an additional level  ((1 ((5 6) (10 15))) (2 ((1 5) (2 7))))
    (define-test (weight-test3)  
        (define lb (make-branch 1 (make-mobile (make-branch 5 6 ) (make-branch 10 15)))) ; weight 21
        (define rb (make-branch 2 (make-mobile (make-branch 1 5) (make-branch 2 7)))) ; weight 12
        (define mobile (make-mobile lb rb))
        
        (check (= 33 (total-weight mobile)) "expected weight is 33")
    )
)

(in-test-group balance-tests
    ;check the balance of a simple mobile
    (define-test (balance-test1)  
        (define lb (make-branch 5 10))
        (define rb (make-branch 10 5))
        (define mobile (make-mobile lb rb))
        (check (balanced? mobile) "this should be a balanced mobile")
    )

    ;check the balance of a simple mobile
    (define-test (balance-test2)  
        (define lb (make-branch 2 10))
        (define rb (make-branch 10 5))
        (define mobile (make-mobile lb rb))   
        (check (not (balanced? mobile)) "this should not be a balanced mobile")
    )

    ; create another balanced tree ((2 20) (4 ((1 5 )(1 5))))
    (define-test (balance-test3)  
        (define lb (make-branch 2 20)) ; 2*20
        (define rb (make-branch 4 (make-mobile (make-branch 1 5) (make-branch 1 5)))) ; 4*10
        (define mobile (make-mobile lb rb))  
        (check (balanced? mobile) "this should be balanced mobile")
    )

    ; create another balanced tree ((2 ((1 10) (1 10))) (4 10))
    (define-test (balance-test4)  
        (define lb (make-branch 2 (make-mobile (make-branch 1 10) (make-branch 1 10)))) ; 2*20
        (define rb (make-branch 4 10)) ; 4*10
        (define mobile (make-mobile lb rb)) 
        (check (balanced? mobile) "this should be balanced mobile")
    )

    (define-test (balance-test5)  
        (define lb (make-branch 2 (make-mobile (make-branch 1 10) (make-branch 1 10))))
        (define rb (make-branch 4 (make-mobile (make-branch 1 5) (make-branch 1 5))))
        (define mobile (make-mobile lb rb)) 
        (check (balanced? mobile) "this should be balanced mobile")
    )

    ; create another unbalanced tree ((2 20) (4 ((1 3 )(1 7))))
    ; it is balanced from a weights perspective. But notice that the right branch is unbalanced, so the
    ; mobile as a whole will be unbalanced
    (define-test (balance-test6)  
        (define lb (make-branch 2 20)) ; 2*20
        (define rb (make-branch 4 (make-mobile (make-branch 1 3) (make-branch 1 7)))) ; 4*10
        (define mobile (make-mobile lb rb))
        (check (not (balanced? mobile)) "this should NOT be balanced mobile")
    )

    (define-test (balance-test7)  
        (define lb (make-branch 4 (make-mobile (make-branch 1 3) (make-branch 1 7)))) ; 4*10
        (define rb (make-branch 2 20)) ; 2*20
        (define mobile (make-mobile lb rb))
        (check (not (balanced? mobile)) "this should NOT be balanced mobile")
    )
)

; 
; run all the tests
(run-registered-tests)

;(run-test '(test0))