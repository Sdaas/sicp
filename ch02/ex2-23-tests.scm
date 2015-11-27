(load "ex2-23.scm")

(define (print-line x)
    (newline)
    (display x)
)
(define items (list 10 20 30))
(my-for-each print-line items)