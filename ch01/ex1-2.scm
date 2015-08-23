; Translate the following into prefix
;  5+4+(2−(3−(6 + 4/5)))    14.8
;  --------------------- = ----
;  3(6 − 2)(2 − 7)          -60

(define num (+ 4 5 (- 2 (- 3 (+ 6 (/ 4 5))))))
(define den (* 3 (- 6 2) (- 2 7) ))
(/ num den)
