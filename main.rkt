#! /usr/bin/racket
#lang racket/base

(require racket/cmdline)
(require "todo.rkt")
(require "web.rkt")

#| 
   All the below is delaing with cmd 
   Remeber that file needs to be executable
   so: $ chmod a+x
|#

(define task-string (make-parameter null))

(define parser
  (command-line
   #:usage-help
   "Alice help function..."

   #:once-each
   [("-a" "--add-task") ADD
                        "Add a task to todo list"
                        (task-string ADD)]
   #:args () (void)))

