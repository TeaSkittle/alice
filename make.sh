#!/usr/bin/sh
# Simple script to download dependencies and install alice

echo "Installing dependencies..."
#
# TODO:
# Will be checking for installs rather than installing outright
# Tell user to install dependancies before install alice
#
sudo apt-get install pandoc clamav gzip python3 racket -y
echo "Generating man page..."
pandoc /docs/alice.md -s -t man -o /docs/alice.1
if [ ! -d "/usr/local/man/man1" ]; then
    sudo mkdir /usr/local/man/man1
fi
echo "Making ~/.config/alice/ directory..."
if [ ! -d "~/.config/alice" ]; then
    mkdir ~/.config/alice
fi
touch ~/.config/alice/todo.txt
sudo mv /docs/alice.1 /usr/local/man/man1
sudo gzip /usr/local/man/man1/alice.1
sudo mandb
echo "Making alice executable..."
raco exe -o alice /src/main.rkt
echo "Moving to /usr/local/bin/alice..."
sudo mv alice /usr/local/bin/
echo "alice setup compelete\n"
