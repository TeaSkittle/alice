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
+ Install through Racket instead of sh file

## Dependancies

> These packages are installed along with alice when running make.sh

+ Racket
+ Git
+ python3
+ ClamAV
+ pandoc
+ gzip

## Install

:warning: **CURRENTLY RE-DOING, INSTALL SCRIPT NOT WORKING!** :warning:

To install alice on a Debian-based distro, run these commands:
```Bash
curl
```

To uninstall:
```Bash
sudo rm -rf /usr/local/bin/alice && sudo rm /usr/local/man/man1/alice.1.gz
```
