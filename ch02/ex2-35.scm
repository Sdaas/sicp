(load "accumulate.scm")
(load "enumerate-tree.scm")

;Implementation of count-leaves using accumulate. The insight here
;is to "flatten" the trett into a list using enumerate-tree and then
;determine the length
(define (count-leaves tree)
    (define (f this-node higher-terms)
        (+ 1 higher-terms)
    )
    (accumulate f 0 (enumerate-tree tree))
)
