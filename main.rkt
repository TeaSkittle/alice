#! /usr/bin/racket
#lang racket/base

(require racket/cmdline)
(require "todo.rkt")
(require "web.rkt")

;; cmd-line guide: https://jackwarren.info/posts/guides/racket/racket-command-line/?utm_source=pocket_mylist

(define parser
  (command-line
   #:usage-help
   "Usage: alice [OPTION]... [ARGUMENT]"
   "A simple digital personal assistant written in Racket\n"
   
   #:once-each
   [("-l" "--list-tasks") "List tasks in todo list"
                          (task-list)]
   [("-a" "--add-task") TASK
                        "Add a task to todo list"
                        (task-add TASK)]
   [("-d" "--delete-task") TASK
                           "Delete task in todo list by task number"
                           (task-delete (string->number TASK))]
   [("-o" "--open-web") SITE
                        "Open website is default browser(incl"
                        (web-open SITE)]
   [("-s" "--search-web") QUERY
                          "Search the web using DuckDuckGo"
                          (web-search QUERY)]
   
   #:args () (void)))

