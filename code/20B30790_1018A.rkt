; 学籍番号: 20B30790, 名前: 藤井一喜
; 第2回基礎
; 2A-1
(define (icbrt n) (icbrti n 0))
(define (icbrti n x)
  (if (= n (* x x x)) 
    x
    (if (< n (* x x x)) (- x 1) (icbrti n (+ x 1)))))

#|
icbrtとicbrtiを使って末尾再帰で定義している。
xの値を0から１ずつ増やしていき、xの立方数がnと同じになるか、nよりも大きくなった場合に再帰呼び出しを終了し値を返している。
|#

; 実行例
(icbrt 0)
(icbrt 1)
(icbrt 2)
(icbrt 7)
(icbrt 8)
(icbrt 20211018)

; 2A-2
(define (range-sum2 m n) (range-sumi 0 m n))
(define (range-sumi currentValue m n)
  (if (= m n) (+ currentValue n) (range-sumi (+ currentValue m) (+ m 1) n)))

#|
最後に使う手続きが、range-sum2では、range-sumiになっているので、range-sumとは異なり、+ではない。
これが定義した手続きが末尾再帰になっていることを表す。
内部構造は、range-sumiにおいて、第一引数に、現在の値(=currentValue)を、第二引数にどこまで和をとったのかを表すindex(=m)を、そして第三引数に和をとる終了地点を表す値(=n)を引数にとり、m==nとなった場合に値を返す構造である。
|#
; 実行例
(range-sum2 1 10)
(range-sum2 2 3)
(range-sum2 (- 100) 100)
(range-sum2 (- 1000000) 10000000)

; 2A-3
(define (n-times f n) (lambda (x) (n-timesi x f (- n 1))))
(define (n-timesi value f cnt)
  (if (= cnt 0) (f value) (n-timesi (f value) f (- cnt 1))))

#|
末尾再帰にて定義している。n-timesは、１引数をとる手続きfと、適用回数nを引数にとり、fをn回適用する手続きを返す.
fをn回適用する手続きは、xを引数にとり、それをn-timesiという手続きにて計算するという形をとる。
n-timesiは、第１引数に現在の値(=value)を、第２引数に手続きfを、第３引数に残余繰り返し回数(=cnt)をとる。
|#
; 実行例
(define inc (lambda (x) (+ x 1)))
(define add (lambda (x) (n-times inc x)))
(add 10)
((add 10) 20)
((n-times icbrt 2) 512)
((n-times icbrt 2) 20211018)
((n-times icbrt 3) 20211018)