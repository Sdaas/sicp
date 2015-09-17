; Define a point in the x-y coordinate
(define (make-point x y)
    (cons x y)
)

; Get the x-coordinate of a point
(define (x-point point)
    (car point)
)

; Get the y-coordinate of a point
(define (y-point point)
    (cdr point)
)

; print a point
(define (print-point point)
    (display "(")
    (display (x-point point))
    (display ",")
    (display (y-point point))
    (display ")")
)

; Define a line segment in terms of starting point and ending
(define (make-segment start-point end-point)
    (cons start-point end-point)
)

; Get the starting point of the line segment
(define (start-segment segment)
    (car segment)
)

(define (end-segment segment)
    (cdr segment)
)

(define (print-segment segment)
    (display "[")
    (print-point (start-segment segment))
    (print-point (end-segment segment))
    (display "]")
)



