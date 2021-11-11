; 学籍番号: 20B30790, 名前: 藤井一喜
; 第5回基礎
; 5A-1
(define n (list 1 2))
(define (set1! n)
  (set! n (list 1 2)))
(define (set2! x)
  (set! n (list 1 2)))
(define (set3! n)
  (set-car! n (list 1 2)))
(define (set4! n)
  (set-cdr! n (list 1 2)))

; 実行例
n
(set3! n)
n
(set1! n)
n
(set2! n)
n
(set4! n)
n
#|
まず、空所1に set3!を入れる理由は、list nのcar の値を(1 2)に変更することができる変更子がset3!しかないためである。
次に空所2に set1!を入れる理由は、この処理の前後で n の中身が変化していないことである。set1! では引数でうけとったnについて変更を施すように見えるが、
大域環境におけるnを書き換えないので、ここでは何もしない手続きとして使用することができる。
次に、set2!を用いるわけは、n を (1 2)に戻したいので、nを変更することができてかつ、n の値を(1 2)にすることができるものがset2!であるからである。
ここで、set2!が大域環境のnを変更することができるは、引数にxしかとらないので、set2!の内部に存在するnは、その名前の束縛を見つけるために大域環境までフレームを辿るからである。これがset1!と大きく異なる点である。
最後に(1 1 2) = (1 (1 2))に変換したいのでset4!を用いる。set-car!, set-cdr!はset!とは異なり一般手続きであり、名前でなく対(pair)のポインタを変更するという点からset1!のように引数にnというものをとっていても、異なる動作をすることに注意して判断した。
|#

; 5A-2
(define stack '())

(define (push! n)
  (set! stack (cons n stack)))

(define (pop!)
  (if (null? stack)
    '()
    (pop_operation))
  )

(define (pop_operation)
  (define res (car stack))
    (set! stack (cdr stack))
    res)

; 実行例
stack
(push! 1)
stack
(push! 2)
stack
(pop!)
stack
(pop!)
stack
(pop!)
stack

; 5A-3
(define (make-course-record id instructor number)
  (list (cons 'id id)
    (cons 'instructor instructor)
    (cons 'number number)))

(define (set-instructor! course instructor)
  (set-car! (cdr course) (cons 'instructor instructor))
  )
; 実行例
(define fp (make-course-record 'FP 'Tokunaga 'CSC.T263))
(define oop (make-course-record 'OOP 'Kobayashi 'CSC.T273))
fp
(set-instructor! fp 'Moriguchi)
fp
(set-instructor! fp 'tokunaga)
fp
(set-instructor! oop 'Moriguchi)
oop
