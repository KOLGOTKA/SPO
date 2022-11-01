#!/bin/bash

letters=()
#fill array witn input data
i=0
for leteral in $*; do
	letters[$i]=$leteral
	i=$i+1
done

#while read input; do
#	letters[$i]+="$input"
#	i=$i+1
#done

#check input arguments
if (( ${#letters[@]} == 0)); then
	echo "z"
	exit 0 
fi

res=0
#find the summ of the letter code
for ((i = 0; i < ${#letters[@]}; i++)); do
	code=$(printf "%d" "'${letters[$i]}")
	res=$(( $res + $code - 96 ))
done
over=0

#check overfilling
if (( $res/25 > 0 )); then
	over=1
fi
final_code=$(( $res % 25 + 96))
 
#printf "\\$(printf '%03o' "$final_code")"
if (( $over == 1)); then
	printf "\\$(printf '%03o' "$(($final_code - 1))")"
	echo " //overfilling"
else {
	printf "\\$(printf '%03o' "$final_code")"
	echo
} fi
exit 0
