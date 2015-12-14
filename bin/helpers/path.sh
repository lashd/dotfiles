#!/usr/bin/env bash
[[ "$1" != "" ]] && export SCRIPTS_DIR=$1

path() {
  local path=$1
  echo "${SCRIPTS_DIR}/${path}"
}

typeset -xf path