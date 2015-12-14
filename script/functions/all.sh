load_functions(){
  local current_dir=$(dirname ${BASH_SOURCE[0]})
  source "${current_dir}/current_dir.sh"
  source "${current_dir}/link_file.sh"
  source "${current_dir}/messaging.sh"
  source "${current_dir}/files.sh"
  source "${current_dir}/installed.sh"
}
load_functions

