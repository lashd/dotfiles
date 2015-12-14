#!/usr/bin/env bash
HELPERS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/helpers" && pwd )"
SCRIPTS_DIR=$1
RESOURCES_DIR=$2

source "${HELPERS_DIR}/load_script.sh"
source "${HELPERS_DIR}/path.sh" ${SCRIPTS_DIR}
source "${SCRIPTS_DIR}/functions/messaging.sh"
source "${HELPERS_DIR}/run_test.sh" ${RESOURCES_DIR}
source "${HELPERS_DIR}/find_files.sh"
source "${SCRIPTS_DIR}/constants.sh"
