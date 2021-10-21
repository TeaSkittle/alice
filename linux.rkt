;; Date: 10-17-2021
;; Functions for Linux commands
#lang racket/base

(require racket/system)
(require "web.rkt")
(provide (all-defined-out))

;; Scan directory with ClamAV, ClamAV's a dependancy
(define (linux-scan directory)
  (system "sudo freshclam")
  (system (string-append "sudo clamscan -i -r --bell " directory)))

;; Update system, -u --update-system
(define (linux-update)
  (system "sudo apt update && sudo apt upgrade -y"))
  
