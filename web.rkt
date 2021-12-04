#lang racket/base

(require racket/system)
(require net/sendurl)
(require net/url)
(require racket/port)

; Web browser functions

(provide (all-defined-out))

; Music url
(define music-url "https://youtube.com/playlist?list=PLUlsSisLm8rY1HUxCwZcOaCOHHyuNHH8z")

; open search query in browser
(define (web-search input)
  (send-url (string-append "https://duckduckgo.com/?q=" input)))

; input for search
(define (web-search-input)
  (display "Search: ")
  (web-open (read-line)))

; open specific site in browser
; site must include http/s
; may modifiy to eliminate input need for "https://"
(define (web-open site)
  (send-url site))

; Download a file
; tutorial here: https://www.monolune.com/how-to-download-files-using-racket/
(define (web-get file)
  (define out (open-output-file "download" #:exists 'replace))
  (write-bytes (port->bytes (get-pure-port (string->url file))) out)
  (close-output-port out))

