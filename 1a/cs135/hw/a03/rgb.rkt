;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rgb) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 03, Question 3
;; ***************************************************
;;

;; Create list of RGB given three natural numbers 
;; mk-rgb: Nat Nat Nat -> List
(define (mk-rgb r g b)
  (cons r(cons g (cons b empty)))
  )


(define (get-r rgblist)
  (first rgblist)
  )

(define (get-g rgblist)
  (first (rest rgblist))
  )

(define (get-b rgblist)
  (first (rest (rest rgblist)))
  )


(define (rgb->name rgblist) 
  (cond 
    [(and (= (get-r rgblist) 255) (= (get-g rgblist) 0) (= (get-b rgblist) 0)) 'red]
    [(and (= (get-r rgblist) 0) (= (get-g rgblist) 255) (= (get-b rgblist) 0)) 'green]
    [(and (= (get-r rgblist) 0) (= (get-g rgblist) 0) (= (get-b rgblist) 255)) 'blue]
    [(and (= (get-r rgblist) 0) (= (get-g rgblist) 0) (= (get-b rgblist) 0)) 'black]
    [(and (= (get-r rgblist) 255) (= (get-g rgblist) 255) (= (get-b rgblist) 255)) 'white]
    [(and (= (get-r rgblist) 255) (= (get-g rgblist) 255) (= (get-b rgblist) 0)) 'yellow]
    [(and (= (get-r rgblist) 255) (= (get-g rgblist) 0) (= (get-b rgblist) 255)) 'magenta]
    [(and (= (get-r rgblist) 0) (= (get-g rgblist) 255) (= (get-b rgblist) 255)) 'cyan]
  ))

(rest 'red)
