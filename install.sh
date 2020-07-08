#!/usr/bin/env bash
usage() {
    printf "%-5s: %s\n" "-d" "To install for Debian, Ubuntu, Zorin OS, Linux Mint..."
    printf "%-5s: %s\n" "-o" "To install for Arch Linux and Manjaro."
    printf "%-5s: %s\n" "-h" "For help."
}

[ -z "$1" ] && usage

while getopts "d;o;h" VALUE; do
  case "${VALUE}" in
    d) sudo apt-get install ruby gem && gem install colorize tty-prompt ;; 
    o) sudo pacman -S ruby gem && gem install colorize tty-prompt ;;
    h) usage ;;
  esac
done