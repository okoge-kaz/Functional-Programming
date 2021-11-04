; 学籍番号: 20B30790, 名前: 藤井一喜
; 第4回発展
; 4A-1

(define (app lst1 lst2)
  (if (null? lst1) lst2 (cons (car lst1) (app (cdr lst1) lst2))))

(define (rev lst)
  (rev-app lst '())
  )

(define (rev-app lst1 lst2)
  (if (null? lst1)
      lst2
      (rev-app (cdr lst1) (app (list (car lst1)) lst2))
  )
)

#|
revから呼ばれる手続きrev-appを定義し、rev-appでは、lst1がnullになるまで、lst1の先頭から要素を取り出して、lstの先頭にpush_frontしていくような動作をさせる。
これにより、lst2には最終的にrevの引数として渡されたlstを逆順にしたリストが入ることになる。
なお、リストの結合には講義時に紹介された手続きappを利用している。
|#

; 実行例
(rev '())
(rev '(1 2 3))
(rev '(6 5 4 3 2))

; (define (rev-n-list n) (if (= n 0) '() (cons n (rev-n-list (- n 1)))))
; (define test100000 (rev-n-list 100000))
; (rev test100000)

; 4A-2

; listの要素数を返す
(define (llen lst)
  (if (null? lst) 0 (+ 1(llen (cdr lst)))))

; n個先のリストの要素を返す
(define (lref lst n)
  (if (= n 0) (car lst) (lref (cdr lst) (- n 1))))


(define (nth-arg x1 . lst)
  (if (<= x1 0)
    #f
    (if (> x1 (llen lst))
      #f
      (lref lst (- x1 1))
    )
  )
)
#|
まず、nth-argの中で用いられているllen, lrefは講義の際に紹介されていた手続きである。
nth-argの実装は、まずx1の値が0以下またはN以上(引数の個数をNとする)の場合、#fを返すようにif文にて条件分岐を行なっている。
そして、以上のどちらの条件にも引っかからない場合について、lrefを用いてlst(リスト)のx1-1番目の要素を出力するようにしている。
なお、nth-argの引数は、不定個の引数を受け取れるようにしている。
また、引数の個数が0の場合は、引数の個数が足らないのでエラーになる。
|#

; 実行例
(nth-arg 1 1 2 '())
(nth-arg 2 1 2 '())
(nth-arg 3 1 2 '())
(nth-arg 4 1 2 '())
(nth-arg 0)

; 4A-3

(define (fold-left f init lst)
  (if (null? lst)
    init
    (fold-left-i f init lst)
  )
)

(define (fold-left-i f value remain-lst)
  (if (null? remain-lst)
    value
    (fold-left-i f (f value (car remain-lst)) (cdr remain-lst))
  )
)

#|
１つ目の実行例を参考に末尾再帰であることを説明する。
(fold-left + 1 '(1 2 3))のときは、手続きf = + , 初期値init = 10, リストlst = (1 2 3)である。
このとき、末尾再帰の定義である「プログラム本体の最後で自分自身を呼び出す再帰」に即して考えると、最後には、(if (null ? remain-lst))が#tとなり、valueが返るが、これはfold-left-iという手続きの内部のことであるので、最後にfold-left-i自身を呼び出しているといえるので末尾再帰である。

|#

; 実行例
(fold-left + 1 '(1 2 3))
(fold-left cons '() '(1 2 3))
(fold-left - 10 '(1 2 3))
(fold-left - 10 '(1 2 3 4))
(fold-left (lambda (x y) x) #f '(1 2 3))
(fold-left (lambda (x y) y) #f '(1 2 3))