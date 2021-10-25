; 学籍番号: 20B30790, 名前: 藤井一喜
; 第3回基礎
; 3A-1
(define (make-course-record id_ instructor_ number_)
  (cons (cons 'id id_)
        (cons (cons 'instructor instructor_)
              (cons (cons 'number number_) '()))))

; 実行例
(make-course-record 'FP 'Tokunaga 'CSC.T263)
(make-course-record 'OOP 'Kobayashi 'CSC.T273)
#|

|#


; 3A-2
(define (get-id course) (cdr(car course)))
(define (get-instructor course) (cdr(car(cdr course))) )
(define (get-number course) (cdr(car(cdr(cdr course)))))

; 実行例
(define fp (make-course-record 'FP 'Tokunaga 'CSC.T263))
(define oop (make-course-record 'OOP 'Kobayashi 'CSC.T273))
fp
(get-id fp)
(get-instructor fp)
(get-number oop)

#|
|#

; 3A-3
(define (update-instructor course update_instructor)
  (make-course-record (get-id course) update_instructor (get-number course)))

; 実行例
(update-instructor fp 'Moriguchi)
(update-instructor oop 'Moriguchi)
fp
(update-instructor (update-instructor fp 'Moriguchi) 'Tokunaga)
#|
|#