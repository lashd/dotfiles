#!/usr/bin/env bash
SCRIPTS_DIR=$1
HELPERS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/helpers" && pwd )"
RESOURCES_DIR="${HELPERS_DIR}/../resources"

source "${HELPERS_DIR}/load_script.sh"
source "${HELPERS_DIR}/path.sh" ${SCRIPTS_DIR}
source "${SCRIPTS_DIR}/functions/messaging.sh"
source "${HELPERS_DIR}/shunit2.sh" ${RESOURCES_DIR}
source "${HELPERS_DIR}/find_files.sh"
source "${SCRIPTS_DIR}/constants.sh"
