;
; Give a list of available coin denominations, the number of way to create change
; for an amount "a" using "n" kind of coins is equal to
; 
; The number of ways to create change for "a" using all but the first kind of coin
; plus
; The number of ways to create change for "a-d" using all the n kind of coins where
; d is the denomination of the first kind of coin
; 
; ( See SICP book Section 1.2.2)

(define (change amount coins)
    (cond
        ( (= amount 0) 1)     ; we have successfully generate the amount
        ( (< amount 0) 0)     
        ( (null? coins) 0)
        (else (+ (change amount (cdr coins)) (change (- amount (car coins)) coins)))
    )
)


; Solution for how to make change for a=10 when n=(5,10)   10cents based on nickels and pennies
; a=10 n=(5,10)
;   a=10 n=(10)
;       a=10 n=() => return 0
;       a=0  n=(10) => return 1
;   a=5 n=(5,10)
;       a=5 list=(10)
;           a=5 list=() => return 0
;           a=-5 list=(10) => return 1
;       a=0 list=() => return 1
