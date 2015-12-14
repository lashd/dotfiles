#!/usr/bin/env bash

RESOURCES_DIR=$1
FAILURES=()

failed() {
  failed=true
  FAILURES=("${FAILURES[@]}" $1)
}

load_tests() {
  local test_dir=$1
  TEST_FILES=()

  for src in $(findFiles "${test_dir}" "*.sh")
  do
    if [[ "${src}" =~  "_test.sh" ]]; then
      TEST_FILES=("${TEST_FILES[@]}" ${src})
    fi
  done
}

print_test_failures() {
  for test_file in "${FAILURES[@]}"
  do
    error "Failed: ${test_file}"
  done
  error "tests failed"
}

run_test() {
  local test_file=$1
  [[ "${test_file}" =~ .*/test/(.*) ]] && echo ''; info "Running: ${BASH_REMATCH[1]}"

  $(bash "${RESOURCES_DIR}/shunit2-2.1.6/src/shunit2" "${test_file}" 1>&2)
  [[ "$?" != "0" ]] && failed "${test_file}"
}

run_tests() {
  for test_file in "${TEST_FILES[@]}"
  do
    run_test ${test_file}
  done
}

test_failures?() {
  [[ "${#FAILURES[@]}" == "0" ]] && echo "${FALSE}" || echo "${TRUE}"
}

