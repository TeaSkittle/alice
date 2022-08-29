#lang racket/base

(require racket/system)
(require "web.rkt")

; Functions for Linux commands

(provide (all-defined-out))

; Scan directory with ClamAV, ClamAV's a dependancy
(define (linux-scan directory)
  (system (string-append "sudo freshclam && sudo clamscan -i -r --bell " directory)))

; Python simple HTTP server
(define (linux-server)
  (displayln "---------------------------")
  (displayln "IPv4s on this system:\n")
  (system "ip -brief address")
  (displayln "---------------------------")
  (system "python3 -m http.server 8000"))
