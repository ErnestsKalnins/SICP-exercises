;; Exercise

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;; Square-root methods
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

;; Explanation
;; (sqrt 9)
;;
;; (sqrt-iter 1.0 9)
;; 
;; (new-if (good-enough? 1.0 9)
;;	1.0
;;	(sqrt-iter (improve 1.0 9) 9))
;;
;; (new-if #f
;;	1.0
;;	(sqrt-iter 5 9)
;;
;; (new-if #f
;;	1.0
;;	(new-if (good-enough 5 9)
;;		5
;;		(sqrt-iter (improve 5 9) 9))
;;
;; This repeats indefinitely

;; 'if' is a special form with its own evaluation rule. 'new-if' is a regular procedure- both 'then' and 'else' 
;; clauses will get evaluated. 'new-if' in recursive statement causes infinite expansion.

