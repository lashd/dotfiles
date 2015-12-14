#!/usr/bin/env bash

oneTimeSetUp() {
  load_script "functions/installed.sh"
}

testShouldReturnFalse () {
  assertEquals $(installed? bash 2>/dev/null) ${TRUE}
}

testShouldReturnTRUE () {
  assertEquals $(installed? invalid 2>/dev/null) ${FALSE}
}