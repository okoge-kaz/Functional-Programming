; 学籍番号: 20B30790, 名前: 藤井一喜
; 第6回基礎

(define-syntax s-cons (syntax-rules () ((_ a b) (cons a (delay b)))))
(define s-nil '())
(define (s-car s) (car s))
(define (s-cdr s) (force (cdr s)))
(define (s-null? s) (null? s))
(define (s-head s n)
  (cond ((s-null? s) '())
    ((<= n 0) '())
  (else (cons (s-car s) 
    (s-head (s-cdr s) (- n 1))))))
(define (s-filter p s)
  (cond ((s-null? s) '())
    ((p (s-car s)) (s-cons (s-car s) (s-filter p (s-cdr s))))
  (else (s-filter p (s-cdr s)))))
(define (integers-from n)
  (s-cons n (integers-from (+ n 1))))
(define integers* (integers-from 1))
(define (sieve* s)
  (s-cons (s-car s)
    (sieve* (s-filter (lambda (x) (> (modulo x (s-car s)) 0)) (s-cdr s)))))
(define primes* (sieve* (integers-from 2)))
(define (list->stream l) 
  (if (null? l) 
    s-nil 
    (s-cons (car l) (list->stream (cdr l)))))

; 6A-1
(define (exps* x)
  (exps*-i 1 x))
(define (exps*-i value x)
  (s-cons (* value  x) (exps*-i (* value x) x)))
; 実行例
(exps* 1)
(s-head (exps* 1) 10)
(s-head (exps* 2) 10)
(s-head (exps* 1/3) 10)

; 6A-2
(define (s-map2 f stream1 stream2)
  (s-map2-i f stream1 stream2)
  )
(define (s-map2-i f stream1 stream2)
  (if (s-null? stream1)
    '()
    (if (s-null? stream2)
      '()
      (s-cons (f (s-car stream1) (s-car stream2)) (s-map2-i f (s-cdr stream1) (s-cdr stream2)))
    )
  )
)
; 実行例
; 06_A.pdfないの実行例のカッコの位置が不適当であったので修正した。(11/18,10:34)

(s-head (s-map2 (lambda (x y) x) integers* (list->stream '(4 5 6 7))) 10)
(s-head (s-map2 (lambda (x y) y) integers* (list->stream '(4 5 6 7))) 10)
(s-head (s-map2 + (list->stream '(4 5 6 7)) integers* ) 10)
(define fibs* (s-cons 0 (s-cons 1 (s-map2 + fibs* (s-cdr fibs*)))))
(s-head fibs* 10)

; 6A-3

#|
(s-map2 + fibs* (s-cdr fibs*))に着目すると、この手続きは、基本手続き+と、fibs*というストリーム、そして(s-cdr fibs*)というストリームを引数にとるものである。
fibs*は (0 . #<promise>) であり、ストリームである。このことから(s-map2 f (arg1) (arg2)) でfibs* (s-cdr fibs*)が必要になるとforceされfibs*の値が更新されていく
これにより(s-map2 + fibs* (s-cdr fibs*))では常に、前二項の和が次の項になるという形が繰り返されることになる。
よって、fibs*がフィボナッチ数列になる。

> fibs*
(0 . #<promise>)
> (force (cdr fibs*))
(1 . #<promise>)
> (force (cdr (force (cdr fibs*))))
(1 . #<promise>)
> (force (cdr (force (cdr (force (cdr fibs*))))))
(2 . #<promise>)

上記のようになることからも、前述の内容が確かめられる。
|#