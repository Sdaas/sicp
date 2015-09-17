(load "ex2-06.scm")

; The intuition is that for the n-th church numeral, 
; f will be called n times
; (define church-n ( lambda (f) ( lambda (x) (f ( ... (f x))))))

;(define two ( lambda (f) ( lambda (x) (f (f x)))))
;
;(two foo) => (lambda (x) ( foo ( foo x)))

(define (print x) (display "X"))

((zero print) "dummy") ; should not print X
(newline)
((one print) "dummy") ; should print X once
(newline)
((two print) "dummy") ; should print X twice
(newline)
((three print) "dummy") ; should print X 3 times
(newline)

(define five (add two three))
(define ten (add five five))

(integer five)
(integer ten)