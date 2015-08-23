(define (mysqrt x) 

    (define (average x y) ( / (+ x y) 2))
    (define (error x y) (- x (* y y )))

    ; Formula to compute the next estimate of y
    (define (nexty x y) (average y (/ x y)))

    ; We have a good esimate if the current estimate is within 0.1%
    ; of the previous estimate
    (define (isgood yprev y) ( < (/ (abs (- y yprev )) yprev) 0.001 ))

    (define (sqrt-iteration x yprev y)
        (if (isgood yprev y)  y (sqrt-iteration x y (nexty x y)))
    )
    
    ; Evaluate the square root
    (sqrt-iteration x 1 0.1)
)

; Need to be careful here about divide by zeros ...
