#!/usr/bin/env bash
FAILED="failed"
PASSED="passed"
test_files=()
failures=()


failed() {
  failed=true
  failures=("${failures[@]}" $1)
}

run_test() {
  local test_file=$1
  echo $test_file
  bash "$(root_dir)/resources/shunit2-2.1.6/src/shunit2" "${test_file}" 1>&2
  if [[ "$?" != 0 ]]; then
    failed ${test_file}
    echo FAILED
  else
    echo PASSED
  fi
}

path() {
  local path=$1
  echo "$(root_dir)/../${path}"
}
typeset -fx path

root_dir() {
 echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
}

typeset -fx root_dir

findFiles (){
  local directory=$1
  local extension=$2
  echo $(find -H "${directory}" -maxdepth 2 -name "${extension}")
}
typeset -fx findFiles

if [ "$1" !=  "" ]
then
   [[ $(run_test $1) == FAILED ]] && failed $1
else

 for src in $(findFiles "$(root_dir)" "*.sh")
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

if [[ "${#failures[@]}" == 0 ]]; then
  exit 0
else
  for test_file in "${failures[@]}"
  do
    echo "Failed: ${test_file}"
  done
  exit 1
fi




