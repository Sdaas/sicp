
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x))))
)

; What is one ? 
; Consider  ((n f) x)
; The function n is invoked with the parameter f, the the result (which is also a function)
; is invoked with the parameter x. 
; Substituting n="zero" in (n f), this returns (lambda (x) x), which BTW is the identity function
; Invoking (lambda (x) x) with x, evaluates to x
; So (( n f) x)) evaluated for n="zero" evaluates to (x)
; So add-1 n for n="zero" evaluates to
; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; What is two ? 
; Consider (n f) where n = "one"  (lambda (f) (lambda (x) (f x)))
; This evaluates to (lambda (x) (f x))
; Substittig this back in ((n f) x), this evalutes to (f x)
; So add-1 for n="one" evaluates to
;( lambda (f) ( lambda (x) (f (f x))))

(define two ( lambda (f) ( lambda (x) (f (f x)))))

;Doing add-1 for n="two" evaluates to 
(define three ( lambda (f) ( lambda (x) (f (f (f x))))))

;Note that for any number n > 0, it is basically the number of time (f x) has been wrapped with f

; Lets look at what ((n f) x) does. 
; for n="one" this is  ( [ lambda (x) (f x)] x )  evaluates to (f x)
; for n="two" this is  ( [ lambda (x) (f (f x)) ] x ) evalutes to (f (f x))
;
; In general, for any church numeral m, ((m f) y) wraps y with f another m times
; And for any church numeral n ((n f) x) wraps x with f another m times
; Substituting y for x ..
; ( (m f) ((n f) x)  seems to wrap f m+n times around x => which means it it the "m+n" number

; Adds two church numerals
(define (add m n)
    (lambda (f) (lambda (x) ((m f) ((n f) x))))
)

; Returns the integer value of a church numeral
(define (integer n)
    (define (inc x) (+ x 1))
    ((n inc) 0)
)
