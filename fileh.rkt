;; Date: 7-4-2021
;; Basic file handling functions
#lang racket/base
(require racket/file)
(require racket/list)
(provide (all-defined-out)) ; Let all funcitons in file be used in other files

;; Read a file( from yet another scheme tutorial )
(define (read-file file-name)
  (let ((p (open-input-file file-name)))
    (let loop((ls1 '()) (c (read-char p)))
      (if (eof-object? c)
          (begin
            (close-input-port p)
            (list->string (reverse ls1)))
          (loop (cons c ls1) (read-char p))))))

;; Simple file print, no error handling here though
(define (display-file file-name)
  (display (read-file file-name)))

;; Count lines in file
(define (line-count file-name)
  (length (file->lines file-name)))

;; Print file with line numbers
(define (line-print file-name)
  (define x 0)
  (for ([i (file->lines file-name)])
    (set! x (+ x 1))
    (display x)(display "  ")(display i)(newline)))

;; Write to file, writes over file if it exists
(define (write-file file-name contents)
  (define out (open-output-file file-name #:exists 'truncate))
  (display contents out)
  (close-output-port out))

;; Append to file
(define (append-file file-name contents)
  (define out (open-output-file file-name #:exists 'append))
  (display contents out)
  (close-output-port out))
  
;; Remove lines from file( https://rosettacode.org/wiki/Remove_lines_from_a_file#Racket )
(define (remove-lines file from num)
  (define lines (file->lines file))
  (define-values (pfx rest) (split-at lines (sub1 from)))
  (display-lines-to-file (append pfx (drop rest num)) file #:exists 'replace))

;; Remove specific line from file
(define (remove-line file num)
  (remove-lines file num 1))
