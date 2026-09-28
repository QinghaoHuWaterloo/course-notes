;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname activation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 02, Question 2
;; ***************************************************
;;

;; Part (a)
;; Sigmoid activation function transforms an inexact number into a value between 0 and 1
;; sigmoid: Num -> Num
(define (sigmoid x)
  (/ 1 (+ 1 (exp (- x))))
  )

;; test cases
(check-within (sigmoid (sqrt 2)) 0.804429 0.00001)
(check-within (sigmoid 0.33333) 0.58257 0.00001)

;; Part (b)
;; Rectified Linear Unit function, output 0 when x < 0 and x when x >= 0
;; relu: Num -> Num
(define (relu x)
  (cond
    [(< x 0) 0]
    [(>= x 0) x]
    )
  )

;; test cases
(check-expect (relu 0) 0)
(check-expect (relu 1) 1)
(check-expect (relu 0.33) 0.33)
(check-expect (relu (- 0.33)) 0)
(check-expect (relu (- 1)) 0)

;; Part (c)
;; Implementation of swish activation function
;; swish: Num -> Num
(define (swish x) (* x (sigmoid x)))

;; test cases
(check-within (swish (sqrt 2)) 1.13763 0.00001)
(check-within (swish 0.33333) 0.19418 0.00001)

;; Part (d)
;; Implementation of hard-sigmoid function
;; hard-sigmoid: Num -> Num
(define (hard-sigmoid x)
  (cond
    [(<= x -3) 0]
    [(and (< -3 x) (< x 3)) (/ (+ x 3) 6)]
    [else 1]))

;; test cases
(check-expect (hard-sigmoid -4) 0)
(check-expect (hard-sigmoid -3) 0)
(check-within (hard-sigmoid -2) 0.16666 0.0001)
(check-within (hard-sigmoid 0) 0.5 0.0001)
(check-expect (hard-sigmoid 3) 1)
(check-expect (hard-sigmoid 5) 1)

;; Part (e)
;; Implementation of hard-swish function
;; hard-swish: Num -> Num
(define (hard-swish x) (* x (hard-sigmoid x)))
;; test cases
(check-expect (hard-swish -4) 0)
(check-expect (hard-swish -3) 0)
(check-within (hard-swish -2) -0.33332 0.0001)
(check-expect (hard-swish 0) 0)
(check-expect (hard-swish 3) 3)
(check-expect (hard-swish 5) 5)