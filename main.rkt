#! /usr/bin/racket
#lang racket/base

(require racket/cmdline)
(require "task.rkt")
(require "web.rkt")
(require "linux.rkt")

(provide (all-defined-out))

;; cmd-line guide: https://jackwarren.info/posts/guides/racket/racket-command-line/

(define version "Testing")

(define parser
  (command-line
   #:usage-help
   "A simple digital personal assistant written in Racket."
   
   #:once-each
   [("--version") "Display Alice version"
                  (printf "Alice: ~a\n" version)]
   [("-l" "--list-tasks") "List tasks in todo list"
                          (task-list)]
   [("-a" "--add-task") TASK
                        "Add a task to todo list"
                        (task-add TASK)]
   [("-d" "--delete-task") TASK
                           "Delete task in todo list by task number"
                           (task-delete (string->number TASK))]
   [("-o" "--open-web") SITE
                        "Open website in default web browser(must include http/s)"
                        (web-open SITE)]
   [("-s" "--search-web") QUERY
                          "Search the web using DuckDuckGo"
                          (web-search QUERY)]
   [("-g" "--get-file") FILE
                        "Download file from the web"
                        (web-get FILE)]
   [("-c" "--clamav-scan") DIR
                           "Scan for infected files in specified directory with ClamAV"
                           (linux-scan DIR)]
   [("-f" "--file-server") "Simple HTTP server via python3"
                           (linux-server)]
   [("-m" "--music") "Open a YouTube playlist with background music"
                     (web-open "https://youtube.com/playlist?list=PLUlsSisLm8rY1HUxCwZcOaCOHHyuNHH8z")]
   
   #:args () (void)))

