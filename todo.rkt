;; Date: 9-23-2021
;; todo list functions
#lang racket/base

(require racket/file)
(require "fileh.rkt")
(provide (all-defined-out))

;; Todo file location
(define task-file "todo.txt")

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

