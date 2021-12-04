#lang racket/base

(require racket/file)
(require "fileh.rkt")

; todo list functions

(provide (all-defined-out))

; Todo file location
(define task-file
  (string-append (path->string
                  (find-system-path 'home-dir))
                 ".config/alice/todo.txt"))

; Add a task
(define (task-add task)
  (append-file task-file
               (string-append task " \n")))

; Delete a task
(define (task-delete task-number)
  (remove-line task-file task-number))

; List tasks
(define (task-list)
  (line-print task-file))

