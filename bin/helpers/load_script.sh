#!/usr/bin/env bash

load_script() {
  local script=$1
  source $(path $script)
}

typeset -xf load_script