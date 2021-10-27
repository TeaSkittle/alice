# alice

<img src ="alice.jpeg" align="right" alt="Alice logo" width="300">

A simple CLI personal assistant written in [Racket](https://racket-lang.org/), aimed at Debian-based Linux systems. This is a current W.I.P. that is a side project and hobby, so updates are inconsistent.

**Current Features**

+ A todo list
+ Search the web and open websites
+ Download files from the web
+ Scan system with ClamAV

**Planned Features**

+ iptables commands
+ Update system and packages
+ Interactive mode
+ Personality in interactive mode (opening message for example)
+ Open background music in browser
+ Install with Racket (instead of using shell script)

## Install

To install alice run these commands:
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
