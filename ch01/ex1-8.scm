; Cube Root
; 
; Newton's approximattion to the cube root of x is given as 
;
; x/y^2 +2y
; ---------
; 3




(define (mycuberoot x) 
    ; define all the helper functions

    ; compute the next estimte of y
    (define (nexty x y) ( / (+ (* 2 y) ( / x (square y)) ) 3 ))

    ; We have a good esimate if the current estimate is within 0.1%
    ; of the previous estimate
    (define (isgood yprev y) ( < (/ (abs (- y yprev )) yprev) 0.001 ))

    (define (cuberoot-iteration x yprev y)
        (if (isgood yprev y)  y (cuberoot-iteration x y (nexty x y)))
    )

    ; Evalute the cube root
    (cuberoot-iteration x 1 0.1)
)