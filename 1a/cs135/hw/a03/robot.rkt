;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rgb) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define (mk-state x y direction) 
  (cons x
        (cons y
              (cons direction empty))))

(define (get-x state) 
  (first state))

(define (get-y state) 
  (first (rest state)))

(define (get-direction state) 
  (first (rest (rest state))))

(define (update-direction-turn-left state) 
  (cond 
    [(symbol=? (get-direction state) 'North) 'West]
    [(symbol=? (get-direction state) 'East) 'North]
    [(symbol=? (get-direction state) 'South) 'East]
    [(symbol=? (get-direction state) 'West) 'South]))


(define (update-direction-turn-right state) 
  (cond 
    [(symbol=? (get-direction state) 'North) 'East]
    [(symbol=? (get-direction state) 'East) 'South]
    [(symbol=? (get-direction state) 'South) 'West]
    [(symbol=? (get-direction state) 'West) 'North]))

(define (forward state) 
  (cond 
    [(symbol=? (get-direction state) 'North) (mk-state (get-x state) (+ 1 (get-y state)) (get-direction state))]
    [(symbol=? (get-direction state) 'East) (mk-state (+ 1 (get-x state)) (get-y state) (get-direction state))]
    [(symbol=? (get-direction state) 'South) (mk-state (get-x state) (- 1 (get-y state)) (get-direction state))]
    [(symbol=? (get-direction state) 'West) (mk-state (- 1 (get-x state)) (get-y state) (get-direction state))]))

(define (robot-ctl state 'Command) 
  (cond 
    [(symbol=? 'command 'Forward) (forward state)]

;; (define (robot-ctl state) (


(define (odd-sum lon) 
  (cond 
    [(empty? lon) 0]
    [(zero? (remainder (first lon) 2)) (odd-sum (rest lon))]
    [else (+ (first lon) (odd-sum (rest lon)))]))

