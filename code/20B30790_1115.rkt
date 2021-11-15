(define q (delay (+ a b)))
; (let ((a 10) (b 20)) (force q)) 
; 3
(let ((a 10) (b 20)) (set! q (delay (+ a b))))
(force q)

(define (tarai x y z)
  (if (<= x y)
    y
    (tarai (tarai (- x 1) y z) (tarai (- y 1) z x) (tarai (- z 1) x y))))

(#%require (only racket/base time))

; (time (tarai 12 6 0))
; ; cpu time: 584 real time: 650 gc time: 144

; (time (tarai 13 6 0))
; ; cpu time: 3511 real time: 3943 gc time: 969

; (time (tarai 14 6 0))
; ; cpu time: 23080 real time: 26131 gc time: 6260

(define (tarai2 x y z) 
  (if (<= x y) 
    y 
    (let ((z2 (force z))) 
      (tarai2 (tarai2 (- x 1) y z) 
        (tarai2 (- y 1) z2 (delay x)) 
        (delay (tarai2 (-z2 1) x (delay y)))))))

(define (tarai3 x y z) 
  (if (<= x y) 
    y 
    (let ((z2 (z))) 
      (tarai3 (tarai3 (- x 1) y z) 
      (tarai3 (- y 1) z2 (lambda () x)) 
      (lambda () (tarai3 (-z2 1) x (lambda () y)))))))


(time (tarai2 12 6 (delay 0)))
(time (tarai2 13 6 (delay 0)))
(time (tarai2 14 6 (delay 0)))
; すべて cpu time: 0 real time: 0 gc time: 0

(time (tarai3 12 6 (lambda () 0)))
(time (tarai3 13 6 (lambda () 0)))
(time (tarai3 14 6 (lambda () 0)))
; すべて cpu time: 0 real time: 0 gc time: 0