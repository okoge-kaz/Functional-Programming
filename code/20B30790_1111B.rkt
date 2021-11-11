; 学籍番号: 20B30790, 名前: 藤井一喜
; 第5回発展
; 5B-1
(define (pop_operation stack)
  (define res (car stack))
    (set! stack (cdr stack))
    res)

(define (make-stack)
  (let ((stack '()))

    (list
      ; empty()
      (lambda () 
        (if (null? stack)
          #t
          #f)
      )
      ; push()
      (lambda (x) 
        (set! stack (cons x stack))
      )
      ; pop()
      (lambda () 
        (if (null? stack)
        '()
          (let ((res '())) 
            (lambda ()
              (('())))
            ; defineがエラーになるので代わりに
            (set! res (car stack))
            (set! stack (cdr stack)
              )
            res)
        )
      )
    
    )))

; 実行例
(define s1 (make-stack))
s1
(define s2 (make-stack))
(define (s-empty? s) ((car s)))
(define (s-push! s e) ((cadr s) e))
(define (s-pop! s) ((caddr s)))
(s-empty? s1)
(s-empty? s2)
(s-push! s1 1)
(s-empty? s1)
(s-empty? s2)
(s-push! s2 2)
(s-empty? s2)
(s-pop! s1)
(s-empty? s1)
(s-empty? s2)
(s-pop! s1)
(s-push! s2 3)
(s-pop! s2)
(s-pop! s2)
(s-empty? s1)
(s-empty? s2)

; 5B-2

(define namelist '())

(define (search name)
  (search-i namelist name))

(define (search-i lst name)
  (if (null? lst)
    #f
    (if (eq? (car lst) name)
      #t
      (search-i (cdr lst) name))))

(define (add! name)
  (if (not (search name))
    (set! namelist (app namelist (cons name '())))
    ; 何もしない
    ))

(define (remove! name)
  (if (search name)
    (if (eq? (car namelist) name); 1つ目がnameのとき
      (set! namelist (cdr namelist))
      (remove-i namelist name '())
    )
    ))

(define (app lst1 lst2)
  (if (null? lst1) lst2 (cons (car lst1) (app (cdr lst1) lst2))))

(define (remove-i lst name rest)
  (if (eq? (car lst) name)
      (let ((lst2 (cdr lst))) (lambda () (('())))
      (set! namelist (app rest lst2)))
    (remove-i (cdr lst) name (app rest (list(car lst)))))
    )


; 実行例
(search 'Moriguchi)
(add! 'Moriguchi)
(search 'Moriguchi)
(search 'Tokunaga)
(remove! 'Moriguchi)
(search 'Moriguchi)
(add! 'Moriguchi)
(search 'Moriguchi)
(add! 'Tokunaga)
(add! 'Moriguchi)
(search 'Tokunaga)
(search 'Moriguchi)
(remove! 'Tokunaga)
(search 'Tokunaga)
(remove! 'Moriguchi)
(search 'Moriguchi)