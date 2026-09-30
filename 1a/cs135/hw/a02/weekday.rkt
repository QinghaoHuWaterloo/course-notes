;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname weekday) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 02, Question 5
;; ***************************************************
;;

;; helper functions
;; Return year for given date
;; year Nat -> Nat
(define (year date)
  (floor (/ date 10000)))

;; return month for given date
;; month: Nat -> Nat
(define (month date)
  (floor (/ (modulo date 10000) 100)))

;; return day at given date
;; day : Nat -> Nat
(define (day date)
  (modulo date 100))

;; return month code according to the algorithm
;; month-code: Nat -> Nat
(define (month-code month)
  (cond
    [(= month 1) 1]
    [(= month 2) 4]
    [(= month 3) 4]
    [(= month 4) 0]
    [(= month 5) 2]
    [(= month 6) 5]
    [(= month 7) 0]
    [(= month 8) 3]
    [(= month 9) 6]
    [(= month 10) 1]
    [(= month 11) 4]
    [(= month 12) 6]))

;; Return weekday represent by n
;; weekday Nat -> Nat
(define (weekday n)
  (cond
    [(= n 0) 'Saturday]
    [(= n 1) 'Sunday]
    [(= n 2) 'Monday]
    [(= n 3) 'Tuesday]
    [(= n 4) 'Wednesday]
    [(= n 5) 'Thursday]
    [(= n 6) 'Friday]))

;; Century code
(define (century-code year)
  (cond
    [(= (modulo (floor (/ year 100)) 4) 0) 6]
    [(= (modulo (floor (/ year 100)) 4) 1) 4]
    [(= (modulo (floor (/ year 100)) 4) 2) 2]
    [else 0]))

;; Give a date, calculate the corresponding the day of the week
;; date->day-of-week: Nat ->  (anyof 'Monday 'Tuesday 'Wednesday 'Thursday 'Friday 'Saturday 'Sunday)
;; Requires: date >= 17530101

(define (date->day-of-week date)
  (weekday 
   (modulo (+ (modulo (year date) 100)
      (floor (/ (modulo (year date) 100) 4))
      (day date)
      (month-code (month date))
      (modulo (- 6 (* 2 (modulo (floor (/ (year date) 100)) 4))) 7)
      (cond
        [(and (zero? (remainder (year date) 400)) (or (= (month date) 1) (= (month date) 2))) -1]
        [(and (not (zero? (remainder (year date) 100))) (zero? (remainder (year date) 4)) (or (= (month date) 1) (= (month date) 2))) -1]
        [else 0])
   ) 7)
  )
  
  )
;; test-cases
(check-expect (date->day-of-week 20240924) 'Tuesday)
(check-expect (date->day-of-week 38781202) 'Monday)
(check-expect (date->day-of-week 19000301) 'Thursday)
(check-expect (date->day-of-week 20240924) 'Tuesday)
(check-expect (date->day-of-week 20000229) 'Tuesday)
(check-expect (date->day-of-week 20260101) 'Thursday)
(check-expect (date->day-of-week 19991231) 'Friday)
(check-expect (date->day-of-week 20240229) 'Thursday)
(check-expect (date->day-of-week 21000301) 'Monday)
(check-expect (date->day-of-week 20000101) 'Saturday)
(check-expect (date->day-of-week 20261231) 'Thursday)
(check-expect (date->day-of-week 17530101) 'Monday)
(check-expect (date->day-of-week 20260301) 'Sunday)
(check-expect (date->day-of-week 24000229) 'Tuesday)
(check-expect (date->day-of-week 21000228) 'Sunday)
(check-expect (date->day-of-week 20231225) 'Monday)
(check-expect (date->day-of-week 20250704) 'Friday)
(check-expect (date->day-of-week 20260401) 'Wednesday)
(check-expect (date->day-of-week 20260515) 'Friday)
(check-expect (date->day-of-week 20260615) 'Monday)
(check-expect (date->day-of-week 20260815) 'Saturday)
(check-expect (date->day-of-week 20261015) 'Thursday)
(check-expect (date->day-of-week 20261115) 'Sunday)

;; I use the algorithm from https://cs.uwaterloo.ca/~alopez-o/math-faq/node73.html
;; For the century code computation, find an interesting thing here: https://users.cs.utah.edu/~blg/resources/notes/math-explorers/calendar_computations.pdf