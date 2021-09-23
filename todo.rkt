#lang racket/base
;; Date: 9-23-2021
(require racket/file)
(require "fileh.rkt")

;; Todo file location
(define task-file "tasks.txt")

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
