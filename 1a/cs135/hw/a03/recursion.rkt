;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 03, Question 1
;; ***************************************************
;;

;; Calculate the Harmonic Numbers
;; harmonic: Nat -> Rat
(define (harmonic n)
  (cond
    [(zero? n) 0]
    [(= n 1) 1]
    [else (+ (/ 1 n) (harmonic (- n 1)))]
  ))

;; Calculate the square of natural number by formula
;; ss-closed: Nat -> Nat
(define (ss-closed n)
  (/ (* n (+ n 1) (+ (* 2 n) 1)) 6)
  )

;; Calculate the square of natural number by recursion
;; ss-recursive: Nat -> Nat
(define (ss-recurssive n)
  (cond
    [(zero? n) 0]
    [else (+ (* n n) (ss-recurssive (- n 1)))]
  ))

  
