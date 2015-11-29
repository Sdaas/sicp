
;return a clone of the input tree where each node has been squared
(define (square-tree tree)
    (if (null? tree)
        (list) ; empty input tree, so return an empty tree
        (let (
                (head (car tree)) 
                (tail (cdr tree)))
            (if (pair? head)
                (cons (square-tree head) (square-tree tail))
                (cons (square head) (square-tree tail))
            )
        )
    )
)