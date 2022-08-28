# alice

<img src ="alice.jpeg" align="right" alt="Alice logo" width="300">

A simple CLI personal assistant written in [Racket](https://racket-lang.org/), aimed at Ubuntu-based Linux systems.

**Current Features**

+ A todo list
+ Search the web and open websites
+ Download files from the web
+ Scan system with ClamAV
+ Open background music in browser
+ Simple server functionality for LAN file sharing
+ Interactive mode

**Planned Features**

+ Personality in interactive mode (opening message for example)
+ Combine with [tutils](https://github.com/TeaSkittle/tutils)
+ Scan system with [Lynis](https://cisofy.com/lynis/)

## Dependancies

> These packages are installed along with alice when running make.sh

+ Racket
+ python3
+ ClamAV
+ pandoc
+ gzip

## Install

To install alice on a Debian-based distro, run these commands:
```Bash
git clone https://github.com/TeaSkittle/alice
cd alice/
sh make.sh
```
To install on other Distros:
> Install dependancies and run the following
```Bash
git clone https://github.com/TeaSkittle/alice
cd alice/
pandoc alice.md -s -t man -o alice.1
sudo mkdir /usr/local/man/man1
mkdir ~/.config/alice
touch ~/.config/alice/todo.txt
sudo mv alice.1 /usr/local/man/man1
sudo gzip /usr/local/man/man1/alice.1
sudo mandb
raco exe -o alice main.rkt
sudo mv alice /usr/local/bin/
```

To uninstall:
```Bash
sudo rm /usr/local/bin/alice && sudo rm /usr/local/man/man1/alice.1.gz
```
