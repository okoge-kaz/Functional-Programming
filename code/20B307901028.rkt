(define (lref lst n)
  (if (= n 0) (car lst) (lref (cdr lst) (- n 1))))
; 右の方にどんどんシフトしていく。
; n個先のリストの要素を返す

(define (llen lst)
  (if (null? lst) 0 (+ 1(llen (cdr lst)))))
; 要素の数を返す

; cons up
(define (range a b)
  (if (> a b) '() (cons a (range (+ a 1) b ))))

; cdr down + cons up
(define (app lst1 lst2)
  (if (null? lst1) lst2 (cons (car lst1) (app (cdr lst1) lst2))))
; 2つの連結リストを結合する
; (x . (y . (a . b . (c . ())))) := (x y a b c)

;実行例
(app (list 1 2) (list 3))
(cons 1 (app (list 2) (list 3)))
(cons 1 (cons 2 (app (list) (list 3))))
(cons 1 (cons 2 (list 3)))

(define (map- proc lst)
  (if (null? lst)
      '()
      (cons (proc (car lst)) (map- proc (cdr lst)))))
(define (square x) (* x x))
(define (square-list lst) (map- square lst))
(define (double-list lst) (map- (lambda (x) (* x 2)) lst))
(square-list '(1 2 3))
(double-list '(1 2 3))
(map * '(1 2 3) '(10 20 30))

; filter
(define (filter-out condition lst)
  (cond ((null? lst) '())
        ((condition (car lst)) (cons (car lst) (filter-out condition (cdr lst))))
        (else (filter-out condition (cdr lst)))))

(filter-out odd? '(1 2 3 4))
; remove-if
(define (remove-if condition lst)
  (cond ((null? lst) '())
        ((not (condition (car lst))) (cons (car lst) (remove-if condition (cdr lst))))
        (else (remove-if condition (cdr lst)))))

(remove-if odd? '(1 2 3 4))

; reduce 畳み込み
(define (sum-list first rest)
  (if (null? rest)
      first
      (sum-list (+ first (car rest)) (cdr rest))))
; 実行例
(sum-list 1 '(2 3 4))
(define (sum-list2 lst)
  (if (null? lst)
      0
      (sum-list (car lst) (cdr lst))))
(sum-list2 '(1 2 3 4 5))

(define (sum-list3 lst)
  (if (null? lst)
      0
      ))