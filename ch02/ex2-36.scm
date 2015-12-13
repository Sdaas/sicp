(load "accumulate.scm")

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        (list ) ; return a null list
        (cons (accumulate op init (map car seqs)) (accumulate-n op init (map cdr seqs)))
    )
)