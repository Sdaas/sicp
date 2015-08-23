(define (mysqrt2 x) 

    (define (average a b) ( / (+ a b) 2))
    
    ; Formula to compute the next estimate of y
    (define (nexty y) (average y (/ x y)))

    ; We have a good esimate if the current estimate is within 0.1%
    ; of the previous estimate
    (define (isgood yprev y) ( < (/ (abs (- y yprev )) yprev) 0.001 ))

    (define (sqrt-iteration yprev y)
        (if (isgood yprev y)  y (sqrt-iteration y (nexty y)))
    )
    
    ; Evaluate the square root
    (sqrt-iteration 1 0.1)
)

; Need to be careful here about divide by zeros ...
