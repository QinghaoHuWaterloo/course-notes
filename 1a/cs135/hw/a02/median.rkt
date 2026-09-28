;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname median) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 02, Question 3
;; ***************************************************
;;


;; Get the median of three numbers
;; median-of-3-simple Num, Num, Num -> Num
(define (median-of-3-simple a b c)
  (cond
    [(and (<= (abs (- a (/ (+ a b c) 3))) (abs (- b (/ (+ a b c) 3)))) (<= (abs (- a (/ (+ a b c) 3))) (abs (- c (/ (+ a b c) 3))))) a]
    [(and (<= (abs (- b (/ (+ a b c) 3))) (abs (- a (/ (+ a b c) 3)))) (<= (abs (- b (/ (+ a b c) 3))) (abs (- c (/ (+ a b c) 3))))) b]
    [else c]))

(define (median-of-3 a b c)
(cond
[(or (and (<= b a) (<= a c)) (and (<= c a) (<= a b))) a]
[(or (and (<= a b) (<= b c)) (and (<= c b) (<= b a))) b]
[(or (and (<= b c) (<= c a)) (and (<= a c) (<= c b))) c]))

;; test cases
(check-expect (median-of-3-simple 1 2 3) (median-of-3 1 2 3))
(check-expect (median-of-3-simple 1000 100 10) (median-of-3 1000 100 10))
(check-expect (median-of-3-simple 1000 123 799) (median-of-3 1000 123 799))
(check-expect (median-of-3-simple 100 1000 10) (median-of-3 100 1000 10))