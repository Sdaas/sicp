; The generic "map" function for a tree
(define (tree-map f tree)
    (if (null? tree)
        (list) ; empty input tree, so return an empty tree
        (let (
                (head (car tree)) 
                (tail (cdr tree)))
            (if (pair? head)
                (cons (tree-map f head) (tree-map f tail))
                (cons (f head) (tree-map f tail))
            )
        )
    )
)