; 学籍番号: 20B30790, 名前: 藤井一喜
; 第1回応用
; 1B-1

(define (a-mean x y) (/ (+ x y) 2))

(define (g-mean x y) 
  (if (and (< x 0) (< y 0)) 
    (* (sqrt (* x y)) -1 )
    (sqrt (* x y))
  )
)

; 実行例
(a-mean 1 9)
(g-mean 1 9)
(a-mean -4 -2)
(g-mean -4 -2)
(a-mean 2 -2)
(g-mean 2 -2)
(g-mean -2 2)

; 1B-2

#|
defineが特殊ケースでない場合、defineの目的である'モノに名前を付ける'ということが果たせなくなってしまう。具体的には、(define <name> <something>) という際に、defineによって定義するはずの まだ定義されていない、<name>を評価する必要が生じてしまうという問題が発生する。
|#

; 1B-3
(define (h-mean a b) 
  (cond (
    (or (zero? a) (zero? b)) "zero-division-error1"
    )
      (
      (= a (- b)) "zero-division-error2"
    )
    (#t (/ 2 (+ (/ 1 a) (/ 1 b))))
  )
)
#|
a == 0 or b == 0のときは、zero-division-error1という文字列を返すようにする。
a == -b であるときは、2/0がZeroDivisionErrorなので、a == 0 or b == 0と区別するためにzero-division-error2という文字列を返すようにする。
以上のように、未定義の場合は、文字列を返すようにした。 
|#

; 実行例
(h-mean 2 6)
(h-mean -1 (- (/ 1 3)))
(h-mean 0 7)
(h-mean 9 0)
(h-mean 0 0)
(h-mean 2 -2)