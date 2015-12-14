info () {
  say "  [ \033[00;34mINFO\033[0m ] $1"
}

user () {
  say "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  say "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

error () {
  say "\r\033[2K  [\033[0;31mERROR\033[0m] $1"
}

say () {
  echo -e "$1"  >&2
}


