(load "accumulate.scm")
(load "ex2-36.scm")     ; accumulate-n.scm

; The dot product of two vectors.
; x => row vector, y => column vector
(define (dot-product x y)
    (define yt (car (transpose y)))
    (accumulate + 0 (map * x yt)) ; Using scheme's built in map. 
)

; Multiply the matrix m with the vector v
; m => matrix, v => column vector
(define (matrix-*-vector m v)
    (if (null? m)
        (list)
        (cons (list (dot-product (car m) v)) (matrix-*-vector (cdr m) v))
    )    
)
;(map (lambda (r) (dot-product r v)) m)

; Transpose
(define (transpose m)
    (if (null? m)
        (list)
        (accumulate-n cons (list ) m)
    )
    
)

; Return the first column of a matrix . Think of this as the "car"
(define (first-column m)
    (transpose (list (car (transpose m))))
)

; Remove the first column of the matrix and return the remainder. Think of this as "cdr"
(define (remainder-columns m )
    (transpose (cdr (transpose m)))
)

;Join columns to make a matrix. Think of this as "cons"
; v is a column vector. 
; m is a matrix
(define (join-columns v m)
    ; Its easier to transpose, cons, and transpose back
    (transpose (cons (car (transpose v)) (transpose m)))
)


; M x ( v1 v2 v3) =>  ( M*v1 M*v2 M*v3)
; M x ( v1 [v2 v3]) => ( M*v1  M*[v2 v3])
(define (matrix-*-matrix m n)
    (print "multiply called") (newline)
    (print "m: " m ) (newline)
    (print "n: " n ) (newline)
    (if (null? n)
        (list) ; empty list
        (join-columns (matrix-*-vector m (first-column n)) (matrix-*-matrix m (remainder-columns n)))
    )
)



