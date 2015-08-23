; Using Newtons method to compute the square root of a number x
; y = 1
; while ( y^2 - x > epsilon ) {
;       y = ( y + x/y) / 2        Average of y and x/y
;}
; return y

(define (average x y) ( / (+ x y) 2))
(define (nexty x y) (average y (/ x y)))
(define (error x y) (- x (* y y )))
(define (isgood x y) ( < (abs (error x y)) 0.0001 ))
(define (sqrt-iteration x y )
    (if (isgood x y)  y (sqrt-iteration x (nexty x y)))
)

(define (mysqrt x) (sqrt-iteration x 1))
