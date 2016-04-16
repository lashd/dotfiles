#!/usr/bin/env bash
info () {
  say "[ \033[00;34mINFO\033[0m ] $1"
}

success () {
  say "[ \033[00;32mOK\033[0m ] $1"
}

error () {
  say "[ \033[0;31mERROR\033[0m ] $1"
}

say () {
  echo -e "$1"  >&2
}


