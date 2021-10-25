(define ( fib2 n) (fibi 0 1 n))

(define (fibi a b c)
  (if (= c 0)
    a
    (fibi b (+ a b) (- c 1))
  )
)

(fib2 8)

(define (pwr2 x n) 
  (if (= n 0)
    1
    (pwri x n)
  )
)

(define (pwri x n)
  (if (= n 0)
    1
    (let ((y (pwri x (quotient n 2))))
      (if (even? n) (* y y) (* x y y))
    )
  )
)

(pwr2 2 32)

; Q 2.10 a

((lambda (x y) (+ x y) ) 10 (* y 2))

; Q 2.10 b
