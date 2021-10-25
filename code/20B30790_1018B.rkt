; 学籍番号: 20B30790, 名前: 藤井一喜
; 第2回発展
; 2B-1

(define (cbrt n) (cbrti n 0 n))
(define (cbrti n ok ng)
  (define mid (/ (+ ok ng) 2))
  (if (= n (* mid mid mid)) 
    mid 
    (if (<= (abs (- n (* mid mid mid))) 0.0001) mid 
      (if (> n (* mid mid mid)) (cbrti n mid ng) (cbrti n ok mid)))))

; 実行例
(cbrt 2)
(let ((cbrt2 (cbrt 2))) (* cbrt2 cbrt2 cbrt2))
(define (check o c)
  (let ((cubic (* c c c))
    (epsilon (/ 1 10000)))
      (and (< (- cubic epsilon) o) (< o (+ cubic epsilon)))))
(check 2 (cbrt 2))

(cbrt 2000)
(let ((cbrt2000 (cbrt 2000))) (* cbrt2000 cbrt2000 cbrt2000))

; 2B-2
(define (range-pred-sum f left right) (range-pred-sumi 0 f left right))

(define (range-pred-sumi value f left right)
  (if (= left right) 
    (if (f left) (+ value left) value)
    (if (f left) (range-pred-sumi (+ value left) f (+ left 1) right) (range-pred-sumi value f (+ left 1) right))
  )
)

; 実行例
(range-pred-sum even? 0 10)
(range-pred-sum odd? 0 10)
(range-pred-sum (lambda (x) (= (modulo x 3) 0)) 100 200)

; 2B-3
(define (range-rec f m n)
  (if (= m n) m (range-reci 0 f m n)))
(define (range-reci value f m n)
  (if (= n m) (f m value)
    (if (= value 0) (range-reci (+ value n) f m (- n 1)) (range-reci (f n value) f m (- n 1)))
  )
)

; 実行例
(range-rec + 3 5)
(range-rec - 3 3)
(range-rec - 10 99)
(range-rec + -100000000 100000000)
