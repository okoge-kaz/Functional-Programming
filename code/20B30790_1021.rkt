(define ve (cons 10 20))
; cons でpairを表現する

(car ve)
; vector.first
(cdr ve)
; vector.second

; pairの型を独自実装する
(define (cons+ x y) (lambda (m) (cond ((= m 0) x) ((= m 1) y))))

; lambda が返値なので、返値は手続きである。
(define (car+ v) (v 0))
(define (cdr+ v) (v 1))

; 渡す値にによって.first, .secondを変換する

(define (scale-vec k v) (cons (* k (car v)) (* k (cdr v))))
(define v (cons 1 2))
(scale-vec 5 v)

(define (make-2D-vec x y) (lambda (m) (cond ((= m 0) x) ((= m 1) y))))
(define (x-of v) (v 0))
(define (y-of v) (v 1))

(define vec (make-2D-vec 4 8))
(x-of vec)
(y-of vec)

; signifiant vs. signifie'
(define pi 3.14)
; pi := 表現, 3.14 := 意味

(quote x) ; 記号をquoteは、引数を評価しない
; quoteの役割は、以下のように略記ができるということ
(define x '(10 . 20))
; quoteっている？いらない気が...

(define tmp '('(1 . 2) . '(3 . 4)))
; define (quote x) xの際、２番目のxは評価されるため、quoteの評価しないという特性を失っている

; 特殊形式でなかったら、値を評価するという動作が生じるため、また、引数が１つであることもその要因の１つである。
; 前者はaを評価した10という値が、xに代入されるが、後者はxにaというものが充当され、その際aというものは評価されない

(quote (1 . (+ 2 3))); こっちは(1 . (+ 2 3)) => (1 + 2 3)
(cons 1 (+ 2 3)); (1 5)

(quote (a . b)); (a . b)
(quote (’a . ’b)); ('a . 'b) => ?

; '(a b . c) => (a . (b . c))

