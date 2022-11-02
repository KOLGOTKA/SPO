#!/bin/bash

#read input data 1
read -p "Please write first string: " -r
#split the string into characters
declare -a string
while IFS="" read -r -n 1 c; do
  string+=("$c")
done <<<$REPLY

#read input data 2
read -p "Please write second string: " -r
#split the string into characters
while IFS="" read -r -n 1 c; do
  string+=("$c")
done <<<$REPLY
#sort string
readarray -td ''  sort_str < <(printf '%s\0' "${string[@]}" | sort -z -u)
#write string
for i in ${sort_str[@]}; do
  echo -n $i
done
echo
exit 0