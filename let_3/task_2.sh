#!/bin/bash

swap(){
      tmp=${phrase[$1]}
      phrase[$1]=${phrase[$2]}
      phrase[$2]=$tmp
}
read -p "Please write your phrase: " -r -a phrase

for (( i = 0; i < $(( ${#phrase[@]} - 1 )); i++ )); do
  if (( ${#phrase[$i]} > ${#phrase[$(( $i + 1 ))]})); then
    swap $i $(( $i + 1 ))
  fi

  done

#  for i in ${phrase[@]}; do
#    echo $i
#    done
  exit 0