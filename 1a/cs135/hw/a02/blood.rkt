;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname blood) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ***************************************************
;; Qinghao Hu (21239903)
;; CS 135 Fall 2026
;; Assignment 02, Question 4
;; ***************************************************
;;

;; Question 4 Part (a)
;; can-donate-to/bool? Sym, Sym -> Bool
;; Sym must be (anyof 'O- 'O+ 'A- 'A+ 'B- 'B+ 'AB- 'AB+)

(define (can-donate-to/cond? donor-blood-type recipient-blood-type)
  (cond
    [(symbol=? donor-blood-type 'O-) true]
    
    [(symbol=? recipient-blood-type 'AB+) true]
    
    [(symbol=? donor-blood-type 'O+)
     (cond
       [(symbol=? recipient-blood-type 'O+) true]
       [(symbol=? recipient-blood-type 'A+) true]
       [(symbol=? recipient-blood-type 'B+) true]
       [else false]
       )]

    [(symbol=? donor-blood-type 'A-)
     (cond
       [(symbol=? recipient-blood-type 'A-) true]
       [(symbol=? recipient-blood-type 'A+) true]
       [(symbol=? recipient-blood-type 'AB-) true]
       [else false]
       )]

    [(symbol=? donor-blood-type 'A+)
     (cond
       [(symbol=? recipient-blood-type 'A+) true]
       [else false]
       )]

    [(symbol=? donor-blood-type 'B-)
     (cond
       [(symbol=? recipient-blood-type 'B-) true]
       [(symbol=? recipient-blood-type 'B+) true]
       [(symbol=? recipient-blood-type 'AB-) true]
       [else false]
       )]

    [(symbol=? donor-blood-type 'B+)
     (cond
       [(symbol=? recipient-blood-type 'B+) true]
       [else false]
       )]
    

    [(symbol=? donor-blood-type 'AB-)
     (cond
       [(symbol=? recipient-blood-type 'AB-) true]
       [else false]
       )]
    [else false]
    ))

;; Question 4 Part (b)
;; can-donate-to/bool? Sym, Sym -> Bool
;; Sym must be (anyof 'O- 'O+ 'A- 'A+ 'B- 'B+ 'AB- 'AB+)

(define (can-donate-to/bool? donor-blood-type recipient-blood-type)
  (or
    (symbol=? donor-blood-type 'O-)
    
    (symbol=? recipient-blood-type 'AB+)
    
    (and (symbol=? donor-blood-type 'O+)
     (or
       (symbol=? recipient-blood-type 'O+)
       (symbol=? recipient-blood-type 'A+) 
       (symbol=? recipient-blood-type 'B+)))

    (and (symbol=? donor-blood-type 'A-)
     (or
       (symbol=? recipient-blood-type 'A-)
       (symbol=? recipient-blood-type 'A+) 
       (symbol=? recipient-blood-type 'AB-)))

    (and (symbol=? donor-blood-type 'A+) 
       (symbol=? recipient-blood-type 'A+))

    (and (symbol=? donor-blood-type 'B-)
         (or
          (symbol=? recipient-blood-type 'B-)
          (symbol=? recipient-blood-type 'B+) 
          (symbol=? recipient-blood-type 'AB-)))
    
    (and (symbol=? donor-blood-type 'B+) 
       (symbol=? recipient-blood-type 'B+))

    (and (symbol=? donor-blood-type 'AB-)
       (symbol=? recipient-blood-type 'AB-))
    ))

;; test cases for (a)
(check-expect (can-donate-to/cond? 'B- 'AB-) true)
(check-expect (can-donate-to/cond? 'A+ 'O+) false)
(check-expect (can-donate-to/cond? 'O+ 'A+) true)
(check-expect (can-donate-to/cond? 'AB- 'AB-) true)
(check-expect (can-donate-to/cond? 'B+ 'B+) true)
(check-expect (can-donate-to/cond? 'A- 'A-) true)
(check-expect (can-donate-to/cond? 'O- 'B-) true)
(check-expect (can-donate-to/cond? 'B- 'O+) false)
(check-expect (can-donate-to/cond? 'O+ 'B+) true)
(check-expect (can-donate-to/cond? 'AB+ 'O-) false)
(check-expect (can-donate-to/cond? 'A- 'AB-) true)
(check-expect (can-donate-to/cond? 'B+ 'A+) false)
(check-expect (can-donate-to/cond? 'A+ 'A+) true)
(check-expect (can-donate-to/cond? 'AB- 'B-) false)
(check-expect (can-donate-to/cond? 'O+ 'O+) true)
(check-expect (can-donate-to/cond? 'B- 'B-) true)
(check-expect (can-donate-to/cond? 'A- 'B+) false)
(check-expect (can-donate-to/cond? 'B- 'B+) true)
(check-expect (can-donate-to/cond? 'A- 'A+) true)
(check-expect (can-donate-to/cond? 'O+ 'A-) false)
(check-expect (can-donate-to/cond? 'A+ 'AB+) true)

;; test cases for (b)
(check-expect (can-donate-to/bool? 'B- 'AB-) true)
(check-expect (can-donate-to/bool? 'A+ 'O+) false)
(check-expect (can-donate-to/bool? 'O+ 'A+) true)
(check-expect (can-donate-to/bool? 'AB- 'AB-) true)
(check-expect (can-donate-to/bool? 'B+ 'B+) true)
(check-expect (can-donate-to/bool? 'A- 'A-) true)
(check-expect (can-donate-to/bool? 'O- 'B-) true)
(check-expect (can-donate-to/bool? 'B- 'O+) false)
(check-expect (can-donate-to/bool? 'O+ 'B+) true)
(check-expect (can-donate-to/bool? 'AB+ 'O-) false)
(check-expect (can-donate-to/bool? 'A- 'AB-) true)
(check-expect (can-donate-to/bool? 'B+ 'A+) false)
(check-expect (can-donate-to/bool? 'A+ 'A+) true)
(check-expect (can-donate-to/bool? 'AB- 'B-) false)
(check-expect (can-donate-to/bool? 'O+ 'O+) true)
(check-expect (can-donate-to/bool? 'B- 'B-) true)
(check-expect (can-donate-to/bool? 'A- 'B+) false)
(check-expect (can-donate-to/bool? 'B- 'B+) true)
(check-expect (can-donate-to/bool? 'A- 'A+) true)
(check-expect (can-donate-to/bool? 'O+ 'A-) false)
(check-expect (can-donate-to/bool? 'A+ 'AB+) true)
(check-expect (can-donate-to/bool? 'AB+ 'AB+) true)
(check-expect (can-donate-to/bool? 'O- 'O-) true)
(check-expect (can-donate-to/bool? 'AB- 'AB+) true)