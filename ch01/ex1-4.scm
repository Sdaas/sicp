; A procedure can evaluate to an operator
; In this case, if b > 0, it returns the "+" operator, else it returns the "-" opr
(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))