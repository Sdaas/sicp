
;A function f is defined by the rule that 
; f(n) = n if n<3,
; f(n)= f(n−1)+2f(n−2)+3f(n−3) if n≥3.
;

; recursive version
(define (frecur x)
    (if (< x 3) x  ( + (frecur (- x 1)) (* 2 (frecur (- x 2))) (* 3 (frecur (- x 3)))))
)

; iterative version
(define (f x)

    (define ( f-iter f3 f2 f1 n x )
        (if (= n x)
            (+ f1 (* 2 f2) (* 3 f3))
            (f-iter f2 f1 (+ f1 (* 2 f2) (* 3 f3)) (+ n 1) x)
        )
    )

    ; do the evaluation
    (if (< x 3)
        x
        (f-iter 0 1 2 3 x)
    )
)

; f(0)  0
; f(1)  1
; f(2)  2
; f(3)  = f(2) + 2f(1) + 3(f0) = 2 + 2.1 + 3.0 = 4
; f(4)  = f(3) + 2f(2) + 3f(1) = 4 + 2.2 + 3.1 = 4 + 4 + 3 = 11
; f(5)  = f(4) + 2f(3) + 3f(2) = 11 + 2.4 + 3.2 = 11 + 8 + 6 = 25
; f(6)  = f(5) + 2f(4) + 3f(3) = 25 + 2.11 + 3.4 = 25 + 22 + 12 = 59

