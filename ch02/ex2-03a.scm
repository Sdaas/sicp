(load "ex2-02.scm")
; It is assuemd that the rectangle egdes are along the x-y axis

; Define the rectangle based on the opposite corner vertices
(define (make-rectangle p1 p2)
    (cons p1 p2)
)

; define the rectangle based on the bottom-left corner, height, and width
(define (make-rectangle2 p1 height width)
    (define p2 (make-point ( + (x-point p1) width ) ( + (y-point p1) height)))
    (make-rectangle p1 p2)
)

(define (print-rectangle r)
    (display "[")
    (print-point (car r))
    (print-point (cdr r))
    (display "]")
)

(define (area-rectangle r1)
    (define p1 (car r1))
    (define p2 (cdr r1))
    (define dx ( - (x-point p2) (x-point p1)))
    (define dy ( - (y-point p2) (y-point p1)))
    (* dx dy)
)

(define (perimeter-rectangle r1)
    (define p1 (car r1))
    (define p2 (cdr r1))
    (define dx ( - (x-point p2) (x-point p1)))
    (define dy ( - (y-point p2) (y-point p1)))
    ( * 2 (+ dx dy))
)