findFiles (){
  local directory=$1
  local extension=$2
  echo $(find -H "${directory}" -maxdepth 2 -name "${extension}")
}
