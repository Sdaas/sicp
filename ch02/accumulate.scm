(load "../print.scm")
; Accumulate.
; Accumulate all the items in the list using the specified operator and the initial value
; The first param to operator is the next element from items
; The second param to operator is the initial-values
(define (accumulate oper init-value items)
    (print "init: " init-value " items: " items)
    (newline)
    (if (null? items)
        init-value
        (oper (car items) (accumulate oper init-value (cdr items)))
    )
)

; There are two ways to do accumulate() depending on whether we "fold-left" or "fold-right"
;
; The above implementation (similar to what is in the book) works as 
;
;(acc * 1 (1 2 3 4))
;(* 1 (acc * 1 (2 3 4)))
;(* 1 (* 2 (acc * 1 (3 4))))
;(* 1 (* 2 (* 3 (acc * 1 (4)))))
;(* 1 (* 2 (* 3 (* 4 (acc * 1 (nil) )))))  ; <= recursion stops here. return 1
;(* 1 (* 2 (* 3 (* 4 1))))  ;
;(* 1 (* 2 (* 3 4)))
;(* 1 (* 2 12))
;(* 1 24)
;24

; An alternative implementation is  
(define (accumulate2 oper init-value items)
    (print "init: " init-value " items: " items)
    (newline)
    (if (null? items)
        init-value
        (accumulate2 oper (oper (car items) init-value) (cdr items))
    )
)

; which ends up doing something like ...
; 
;(acc * 1 (1 2 3 4))
;(acc * (* 1 1) (2 3 4)) => (acc * 1 (2 3 4))
;(acc * (* 2 1) (3 4)) => (acc * 2 (3 4))
;(acc * (* 3 2) (4))   => (acc * 6 (4))
;(acc * (* 4 6) ())    => (acc * 24 ())
;24


; Another example : 
; 
; For  (acc - 5 (list 100 200 300)), the first implementation will work as 
;
;(acc - 5 (100 200 300))
;(- 100 (acc - 5 (200 300)))
;(- 100 (- 200 (acc - 5 (300))))
;(- 100 (- 200 (- 300 (acc - 5 (nil))))) ; <== recursion stops here. return init-value
;(- 100 (- 200 (- 300 (5))))
;(- 100 (- 200 (295)))
;(- 100 (-95))
;195
;
; In a simple way, what happens is => (100 - (200 - (300 -5)))
;
;
; The second implementation will work as
;
;(acc - 5 (100 200 300))
;(acc - (- 100 5) (200 300)) => (acc - 95 (200 300))
;(acc - (- 200 95) (300)) => (acc - 105 (300))
;(acc - (- 300 105) () ) => (acc - 195 ())
;195
;
; This is the same as (300 - (200 - (100 - 5)))
;

; In both examples above, the result was the same for accumulate() and accumulate2(). 
; However, for functions like cons, the output is different. For example
;
; (accumulate cons (list 1) (list 100 200 300 400)) => (100 200 300 400 1)
;(accumulate2 cons (list 2) (list 100 200 300 400)) => (400 300 200 100 1)
;


