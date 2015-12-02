; Example (print "foo" bar " blabh blah" x " " y)

(define (print . args)
  (cond ((not (null? args))
         (display (car args))
         (apply print (cdr args)))))

