; 学籍番号: 20B30790, 名前: 藤井一喜
; 第4回発展
; 4B-1
(define (app lst1 lst2)
  (if (null? lst1) lst2 (cons (car lst1) (app (cdr lst1) lst2))))

(define (flatten lst)
  (merge '() lst)
)

(define (merge lst1 lst2)
  (if (null? lst2)
    lst1
    (merge (app lst1 (car lst2)) (cdr lst2))
  )
)

; 実行例
(flatten '((1 2) (3) (4 5 6)))
(flatten '((1 (2)) (3) ((4 5) 6)))
(flatten '(() () ()))
; 4B-2
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

(define (fold-right f init lst)
  (if (null? lst)
    init
    (fold-right-i f (rev lst) init)
  )
)

(define (fold-right-i f remain-lst value)
  (if (null? remain-lst)
  value
  (fold-right-i f (cdr remain-lst) (f (car remain-lst) value))
  )
)
; 実行例
(fold-right + 1 '(1 2 3))
(fold-right cons '() '(1 2 3))
(fold-right - 10 '(1 2 3))
(fold-right - 10 '(1 2 3 4))
(fold-right (lambda (x y) x) #f '(1 2 3))
(fold-right (lambda (x y) y) #f '(1 2 3))

; 4B-3

(define (is_leaf tree)
  (if (null? (cdr tree))
    #t
    #f
  )
)

(define (map-tree f tree)
  (if (is_leaf tree)
    ; leaf 
    (list (f (car tree)))
    ; node
    (app (list (map-tree f (car tree))) (list (map-tree f (cdr tree))))
  )
)
; 実行例
(map-tree - (cons (cons (list 1) (list 2)) (list 3)))
(map-tree null? (cons (cons (list #t) (list #f)) (cons (list '(1 2)) (list '()))))
(map-tree (lambda (x) (+ x 1)) (list 1))
(map-tree (lambda (t) (map-tree - t)) (list (cons (list 1) (list 2))))
