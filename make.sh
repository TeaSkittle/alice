#!/usr/bin/sh
# Simple script to download dependencies and install alice

echo "Installing dependencies..."
sudo apt-get install pandoc clamav gzip -y
echo "Generating man page..."
pandoc alice.md -s -t man -o alice.1
if [ ! -d "/usr/local/man/man1" ]; then
    sudo mkdir /usr/local/man/man1
fi
sudo mv alice.1 /usr/local/man/man1
sudo gzip /usr/local/man/man1/alice.1
sudo mandb
echo "Makeing alice executable..."
raco exe -o alice main.rkt
echo "Moving to /usr/local/bin/alice..."
sudo cp alice /usr/local/bin/
echo "alice setup compelete\n"

