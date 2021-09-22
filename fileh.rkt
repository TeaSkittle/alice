#lang racket/base
;; By: Travis Dowd
;; Date: 7-4-2021
(require racket/file)
(require racket/list)

#|
  TODO:
    - Figure out where to place todo file
    - Maybe OS detection?
    - Get args from input and cmd line options( will do in another file most likely )
|#

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

;;
;; Stuff most likely to be moved to another rkt file
;;
;; Todo file location
(define task-file "/tmp/tasks.txt")

;; Add a task
(define (task-add task)
  (append-file task-file
               (string-append task " \n")))

;; Delete a task
(define (task-delete task-number)
  (remove-line task-file task-number))

;; List tasks
(define (task-list)
  (line-print task-file))

