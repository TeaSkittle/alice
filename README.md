# alice

<img src ="alice.jpeg" align="right" alt="Alice logo" width="300">

A simple CLI personal assistant written in [Racket](https://racket-lang.org/), aimed at Debian-based Linux systems. This is a current W.I.P. that is a side project and hobby, so updates are inconsistent.

**Current Features**

+ A todo list
+ Search the web and open websites
+ Download files from the web
+ Scan system with ClamAV
+ Open background music in browser
+ Simple server functionality for LAN file sharing

**Planned Features**

+ iptables commands
+ Interactive mode
+ Personality in interactive mode (opening message for example)

## Dependancies

> These packages are installed along with alice when running make.sh

+ Racket
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

To uninstall:
```Bash
sudo rm /usr/local/bin/alice
sudo rm /usr/local/man/man1/alice.1.gz
```
