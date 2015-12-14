#!/usr/bin/env bash
installed?() {
  local application=$1
  if [[ $(which ${application}) == '' ]]; then
    info "${application} not installed"
    echo "${FALSE}"
  else
    echo "${TRUE}"
  fi
}
