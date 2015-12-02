(load "accumulate.scm"); define the common functions using accumate

; define the map function using accumulate
; keep modifying the initial value
(define (map33 f items)
    (accumulate (lambda (x init-value) (append init-value (list (f x))) ) (list) items)
)

; define the append function using accumulate
; note that the solution in the book will not work becuase I have defined accumulate slightly differently.
; see accumulate.m for details
(define (append33 seq1 seq2)

    (define (append-one x list1)
        (if (null? list1)
            (list x)
            (cons (car list1) (append-one x (cdr list1)))
        )
    )
    (accumulate append-one seq1 seq2)
)

(define (length33 items)
    (define (f x init-value)
        (+ init-value 1)
    )
    (accumulate f 0 items)
)
