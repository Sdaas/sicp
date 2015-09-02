; filtered accumulate - iterative version
; This will be used in ex1-33a.scm and ex1-33b

(define (filtered-accumulate filter combiner null-value term a next b)
    ; define an iterative process
    ; key - accumulator value changes only if the filter returns true
    (define (iter a accumulator)
        (cond
            ((> a b) accumulator )
            ((filter a) (iter (next a) ( combiner accumulator (term a))) )
            (else (iter (next a) accumulator )); do not change the accumulator
        )
    )

    ; start the calculation
    (iter a null-value )
)