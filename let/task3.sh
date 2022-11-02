#!/bin/bash

#read input data
read -p "Please write your phrase: " -r
read -p "Please write your shift: " -r shft
declare -a phrase
i=0

#split the string into characters
while IFS="" read -r -n 1 c; do
  phrase+=("$c")
  i=$(($i + 1))
done <<<$REPLY
result=()

#loop scrambler
for ((i = 0; i < ${#phrase[@]}; i++)); do
  code=$(printf "%d" "'${phrase[$i]}")

  #case with number
  if (((($code >= 48)) && (($code <= 57)))); then
    result[$i]=$((9 - ${phrase[$i]}))
  #case with letter
  elif (((($code >= 65)) && (($code <= 90)))); then
    #add shift
    res=$(($shft + $code - 64))
    #check overflow
    final_code=$(($res % 26 + 64))
    #check registry
    if (($i % 2 != 0)); then
      final_code=$(($final_code + 32))
    fi
    #write letter
    result[$i]=$(printf "\\$(printf '%03o' "$final_code")")
  else
    result[$i]=${phrase[$i]}
  fi
done

#printing
for ((i = $((${#result[@]} - 1)); i >= 0; i--)); do
  if (($(printf "%d" "'${phrase[$i]}") == 32)); then
    echo -n " "
  else
    echo -n ${result[$i]}
  fi
done
echo
exit 0
