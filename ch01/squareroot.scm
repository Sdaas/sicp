; Using Newtons method to compute the square root of a number x
; y = 1
; while ( y^2 - x > epsilon ) {
;       y = ( y + x/y) / 2        Average of y and x/y
;}
; return y


(define (mysqrt x) 
    ; define all the helper functions
    (define (average a b) ( / (+ a b) 2))
    (define (error  y) (- x (* y y )))

    ; compute the next estimate of y
    (define (nexty y) (average y (/ x y)))
    
    ; We have a good estimate if this estimate is within 0.001 of the
    ; previous one
    (define (isgood y) ( < (abs (error y)) 0.0001 ))
    
    (define (sqrt-iteration y )
        (if (isgood y)  y (sqrt-iteration (nexty x y)))
    )
    ; Now do the evaluations
    (sqrt-iteration 1.0)
)
