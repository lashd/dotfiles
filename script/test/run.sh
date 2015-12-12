#!/usr/bin/env bash
FAILED="failed"
PASSED="passed"
test_files=()
failures=()
root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

failed() {
  failed=true
  failures=("${failures[@]}" $1)
}

run_test() {
  local test_file=$1
  echo $test_file
  source "${root_dir}/resources/shunit2-2.1.6/src/shunit2" "${test_file}" 1>&2
  if [[ "$?" != 0 ]]; then
    failed ${test_file}
    echo FAILED
  else
    echo PASSED
  fi
}

path() {
  local path=$1
  echo "${root_dir}/../${path}"
}

findFiles (){
  local directory=$1
  local extension=$2
  echo $(find -H "${directory}" -maxdepth 2 -name "${extension}")
}

run_tests() {
  if [ "$1" !=  "" ]
  then
    [[ $(run_test $1) == FAILED ]] && failed $1
  else
    for src in $(findFiles "${root_dir}" "*.sh")
    do
      if [[ "${src}" =~  "_test.sh" ]]; then
        test_files=("${test_files[@]}" ${src})
      fi
    done
    for test_file in "${test_files[@]}"
    do
      [[ $(run_test ${test_file}) == FAILED ]] && failed ${test_file}
    done
  fi
}

run_tests $1

if [[ "${#failures[@]}" == 0 ]]; then
  exit 0
else
  for test_file in "${failures[@]}"
  do
    echo "Failed: ${test_file}"
  done
  exit 1
fi