#!/usr/bin/env bash
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

SCRIPTS_DIR="${ROOT_DIR}/script"
TESTS_DIR="${SCRIPTS_DIR}/test"
source "${ROOT_DIR}/bin/helpers.sh" ${SCRIPTS_DIR} "${TESTS_DIR}/resources"

run() {
  if [ "$1" ==  "" ]
  then
    load_tests "${TESTS_DIR}"
    run_tests
  else
    $(run_test $1)
  fi
}

run $1

if [[ "$(test_failures?)" == "${FALSE}" ]]; then
  success "All tests passed"
  exit 0
else
  print_test_failures
  exit 1
fi