#!/usr/bin/env bash

RESOURCES_DIR=$1
FAILURES=()

failed() {
  FAILED=${TRUE}
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
  local delimeter="-------------------------------------"

  [[ "${test_file}" =~ .*/test/(.*) ]]
  echo ''; info "Running: ${BASH_REMATCH[1]}"; echo ${delimeter}
  $(bash "${RESOURCES_DIR}/shunit2-2.1.6/src/shunit2" "${test_file}" 1>&2)
  [[ "$?" != "0" ]] && failed "${test_file}"
  echo ${delimeter}
}

run_tests() {
  for test_file in "${TEST_FILES[@]}"
  do
    run_test ${test_file}
  done
}

test_failures?() {
  [[ "${FAILED}" == "${TRUE}" ]] && echo "${TRUE}" || echo "${FALSE}"
}

