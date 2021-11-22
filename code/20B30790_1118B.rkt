; 学籍番号: 20B30790, 名前: 藤井一喜
; 第6回発展

(define-syntax s-cons (syntax-rules () ((_ a b) (cons a (delay b)))))
(define s-nil '())
(define (s-car s) (car s))
(define (s-cdr s) (force (cdr s)))
(define (s-null? s) (null? s))
(define (s-head s n)
  (cond ((s-null? s) '())
    ((<= n 0) '())
    (else (cons (s-car s) (s-head (s-cdr s) (- n 1))))))
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
(define (list->stream l) (if (null? l) s-nil (s-cons (car l) (list->stream (cdr l)))))

; 6B-1
(define (s-fold-right f init s)
  (if (s-null? s)
    init
    (f (s-car s) (delay (s-fold-right f init (s-cdr s))))))
; 実行例
(s-fold-right (lambda (a b) (* a (force b))) 1 (list->stream '(1 2 3 4)))
(s-fold-right (lambda (a b) (if (>= a 100) 0 (+ a (force b)))) 0 integers*)
(s-fold-right (lambda (a b) (if (>= a 100) 0 (+ a (force b)))) 0 primes*)

; 6B-2
(define (s-unfold-right f b)
  (s-cons (car (f b)) (s-unfold-right f (cdr (f b)))))
;実行例
(s-head (s-unfold-right (lambda (x) (cons x x)) 2) 10)
(s-head (s-unfold-right (lambda (x) (cons x (+ x 1))) 1) 10)
(s-head
  (s-unfold-right (lambda (x) (cons (car x) (cons (cdr x) (+ (car x) (cdr x)))))
  (cons 0 1))
  10)