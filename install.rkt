#!/usr/bin/racket
#lang racket
(require raco/all-tools)

;
; TODO: Check for dependancies
;

; Download repo
(system "git clone https://github.com/TeaSkittle/alice")

; Create Man Page
(system "pandoc alice/docs/alice.md -s -t man -o alice/docs/alice.1")
;(if (directory-exists? "/usr/local/man/man1")(newline)
;    (system "mkdir /usr/local/man/man1"))
(cond
  [(directory-exists? "/usr/local/man/man1")(newline)]
  [else (system "sudo mkdir /usr/local/man/man1")])

(system "sudo mv alice/docs/alice.1 /usr/local/man/man1/alice.1")
(system "sudo gzip /usr/local/man/man1/alice.1")
(system "sudo mandb")

; Create ~/.config/alice
(cond
    [(file-exists?
      (string-append
       (path->string (find-system-path 'home-dir)) ".config/alice/todo.txt"))]
    [else (make-directory
           (string-append
            (path->string (find-system-path 'home-dir)) ".config/alice"))
          (system "touch ~/.config/alice/todo.txt")])

; Make executable file
; https://stackoverflow.com/questions/41169617/how-to-run-raco-command-from-a-script
;(system "raco exe -o out alice/src/main.rkt") <- old way
(define make (all-tools))
(parameterize ([current-command-line-arguments (vector "-o" "out" "alice/src/main.rkt")])
  (dynamic-require (second (hash-ref make "exe")) #f))
(system "sudo mv out /usr/local/bin/alice")
(delete-directory/files "alice/")

; Finished
(newline)
(displayln "Install Complete")
(newline)
