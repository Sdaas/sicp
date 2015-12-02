(load "accumulate.scm"); define the common functions using accumate

; define the map function using accumulate
; keep modifying the initial value
(define (map33 f items)
    (accumulate (lambda (x init-value) (cons (f x) init-value)) (list) items)
)

; if we want to use accumulate2, the code will look like 
(define (map33-2 f items)
    (accumulate2 (lambda (x init-value) (append init-value (list (f x))) ) (list) items)
)

; define the append function using accumulate
(define (append33 seq1 seq2)
    (accumulate cons seq2 seq1)
)

; if we want to use accumulate2, then we need to implement this slightly differently
(define (append33-2 seq1 seq2)

    (define (append-one x list1)
        (if (null? list1)
            (list x)
            (cons (car list1) (append-one x (cdr list1)))
        )
    )
    (accumulate2 append-one seq1 seq2)
)

(define (length33 items)
    (define (f x init-value)
        (+ init-value 1)
    )
    (accumulate f 0 items)
)
