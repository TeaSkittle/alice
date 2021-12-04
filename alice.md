% alice(1) | General Commands Manual

NAME
====

alice - a simple CLI personal assistant

SYONPSIS
===

alice [options] [string]

DESCRIPTION
===

A simple CLI personal assistant written in Racket aimed at Debian-based Linux systems.

OPTIONS
===

`-h, --help`
: Show the help message and exit

`--version`
: Display version number

`-l, --list-tasks`
: List tasks in todo list

`-a <TASK>, --add-task <TASK>`
: Add a task to todo list

`-d <TASK>, --delete-task <TASK>`
: Delete task in todo list by task number

`-o <SITE>, --open-web <SITE>`
: Open website in default web browser(must include http/s)

`-s <QUERY>, --search-web <QUERY>`
: Search the web using DuckDuckGo

`-g <FILE>, --get-file <FILE>`
: Download file from the web

`-c <DIR>, --clamav-scan <DIR>`
: Scan for infected files in specified directory with ClamAV

`-f, --file-server`
: Simple HTTP server via python3

`-m, --music`
: Open a YouTube playlist with background music

`-i, --interactive`
: Run alice in interactive mode

BUGS
===

Bugs can be reported at https://github.com/TeaSkittle/alice/issues

AUTHOR
==

Travis Dowd

