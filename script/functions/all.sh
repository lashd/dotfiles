load_functions(){
  local current_dir=$(dirname ${BASH_SOURCE[0]})
  source "${current_dir}/current_dir.sh"
  source "${current_dir}/copy_link.sh"
  source "${current_dir}/messaging.sh"
}
load_functions

