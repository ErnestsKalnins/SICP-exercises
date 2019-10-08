(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Normal evaluation
; (test 0 (p))
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; 0

; Applicative-order evaluation
; (test 0 (p))
; (if (= 0 0) 0 (p))
; (if (= 0 0) 0 (p))
; (if (= 0 0) 0 (p))
; this happens indefinitely...
