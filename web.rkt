;; Date: 9-23-2021
;; Web browser functions
#lang racket/base
(require racket/system)
(require net/sendurl)
(provide (all-defined-out))

;; open search query in browser
(define (web-open input)
  (send-url (string-append "https://duckduckgo.com/?q=" input)))

;; input for search
(define (web-search)
  (display "Search: ")
  (web-open (read-line)))
