; 学籍番号: 20B30790, 名前: 藤井一喜
; 第3回発展
; 3B-1
(define (make-course-record-proc id instructor number)
  (lambda (x) 
              (if (eq? x 'id)
                  id
                  (if (eq? x 'instructor)
                      instructor
                      (if (eq? x 'number)
                          number
                          #f )))))

; 実行例
(eq? 'id 'id)
(eq? 'id 'instructor)
(define fp (make-course-record-proc 'FP 'Tokunaga 'CSC.T263))
fp
(fp 'id)
(fp 'instructor)
(fp 'number)

; 3B-2

(define (update-instructor-proc course new-instructor)
  (lambda (x) 
              (if (eq? x 'id)
                  (course 'id)
                  (if (eq? x 'instructor)
                      new-instructor
                      (if (eq? x 'number)
                          (course 'number)
                          #f )))))
; 実行例
(define fp2 (update-instructor-proc fp 'Moriguchi))
fp2
(fp2 'id)
(fp2 'instructor)
(fp2 'number)
(fp 'id)
(fp 'instructor)
(fp 'number)

; 3B-3

; 3A-1で定義したもの
(define (make-course-record id_ instructor_ number_)
  (cons (cons 'id id_)
        (cons (cons 'instructor instructor_)
              (cons (cons 'number number_) '()))))
; 3A-2で定義したもの
(define (get-id course) (cdr(car course)))
(define (get-instructor course) (cdr(car(cdr course))) )
(define (get-number course) (cdr(car(cdr(cdr course)))))

(define (record-to-proc course)
  (lambda (x) 
              (if (eq? x 'id)
                  (get-id course)
                  (if (eq? x 'instructor)
                      (get-instructor course)
                      (if (eq? x 'number)
                          (get-number course)
                          #f )))))
(define (proc-to-record course)
  (cons (cons 'id (course 'id))
        (cons (cons 'instructor (course 'instructor))
              (cons (cons 'number (course 'number)) '()))))
; 実行例
(define fpr (proc-to-record fp))
fpr
(proc-to-record fp2)
(define fpp (record-to-proc fpr))
fpp
(fpp 'id)
(fpp 'instructor)
(fpp 'number)
(equal? (proc-to-record fpp) fpr)