;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 02
;; ***************************************************
;;

;;
;; Question 2, part a
;;

;; Calculate the surface area of a doughnut
(define (doughnut-surface-area r z)
  (* 4 (* r z) (sqr pi))
)

;;
;; Question 2, part b
;;

;; Calculate the pressure of ideal gas
(define R 8.3144626)
(define (pressure n T V)
  (/ (* n R T) V)
)

;;
;; Question 2, part c
;;

;; Calculate the remain weight of a radioactive substance
(define (q s d t)
 (* s (expt e (- (* d t))))
)

;;
;; Question 2, part d
;;

;; Calculate the frequency of sound wave
(define (freq base-frequency interval)
  (* base-frequency (expt 2 (/ interval 12)))
)

