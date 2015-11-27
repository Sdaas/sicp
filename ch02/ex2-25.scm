; Load the unit testing framework
(load "../test-manager/load.scm")

(define-test (test1)
  (define items (list 1 3 (list 5 7) 9)) 
  (newline)
  (display items)
  (define result (car (cdr (car (cdr (cdr items))))))
  (check (= 7 result) "expected 7")
)

(define-test (test2)
  (define items (list (list 7)))
  (newline)
  (display items)
  (define result (car (car items)))
  (check (= 7 result) "expected 7")
)

(define-test (test3)
  (define items (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
  (newline)
  (display items)
  (define result (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items)))))))))))))
  (check (= 7 result) "expected 7")
)

; run all the tests
(run-registered-tests)

; run specific tests
;(run-test '(test3))