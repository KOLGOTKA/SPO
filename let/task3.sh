#!/bin/bash

phrase=()
#read input data
echo -n "Please write your phrase: "
read phrase
echo -n "Please write your shift: "
read shft

for ((i = 0; i < ${#phrase[@]}; i++ )); do
	code=$(printf "%d" "'${phrase[$i]}")
	if (( (( $code >=  48 )) && (( $code <= 57 )) )); then
	fi
done

echo $phrase
echo $shft
exit 0
