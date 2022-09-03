#lang racket/base

; This module is for alice's interactive mode

(require "task.rkt")
(require "web.rkt")
(require "linux.rkt")

(provide (all-defined-out))

; The main input loop
(define (prompt)
  (display "> ")
  (define command (read-line))
  (cond [(string=? command "help")(help)(prompt)]
        [(string=? command "list")(task-list)(prompt)]
        [(string=? command "server")(linux-server)(prompt)]
        [(string=? command "music")(web-open music-url)(prompt)]
        ; Get more input
        [(string=? command "add")(display "> ")(task-add (read-line))(prompt)]
        [(string=? command "delete")(display "> ")(task-delete (read-line))(prompt)]
        [(string=? command "open")(display "> ")(web-open (read-line))(prompt)]
        [(string=? command "search")(display "> ")(web-search (read-line))(prompt)]
        [(string=? command "get")(display "> ")(web-get (read-line))(prompt)]
        [(string=? command "scan")(display "> ")(linux-scan (read-line))(prompt)]
        ; Exit and errors
        [(string=? command "exit")(displayln "exited successfully...")]
        [else (displayln "unkown command")(prompt)]))

; List commands
(define (help)
  (displayln "Available commands")
  (displayln "------------------")
  (displayln "list - list tasks in todo list")
  (displayln "add - add a task to todo list")
  (displayln "delete - delete a task in todo list by task number")
  (displayln "open - open website in default web browser(must include http/s)")
  (displayln "search - search the web using DuckDuckGo")
  (displayln "get - download a file from the web")
  (displayln "scan - scan for infected files in specified directory with ClamAV")
  (displayln "server - simple HTTP server via python3")
  (displayln "music - open a YouTube playlist with background music"))