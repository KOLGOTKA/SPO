#!/bin/bash

size=$1
let size_1=( $size - 1 )
let size_2=( $size - 2 )

declare -a massive
declare -a chair_numbers
for ((i=0;i<=size_1;i++))
do
	let a=$i+1
	chair_numbers[$i]=$a
done
for ((i=0;i<=size_1;i++))
do
	massive[$i]=0
done
massive[0]=1
massive[$size_1]=2

for ((i=3;i<=size;i++))
do
	counter=0
	pos_1=0
	pos_2=0
	max_length=0
		for ((j=1;j<=size_1;j++))
		do
		if [[ ${massive[$j]} == 0 ]]
		then
		

			let counter=$counter+1
		else
		
			if [[ $counter>$max_length ]]
			then
				pos_1=$pos_2
				max_length=$counter
			fi
			pos_2=$j
			counter=0
		fi

	done
	pacient_pos=0
	if (( $max_length % 2 == 0 ))
	then
		pacient_pos=$(( $pos_1 + $max_length / 2 ))
	else
		pacient_pos=$(( $pos_1 + 1 + $max_length / 2 ))
	fi
	massive[$pacient_pos]=${chair_numbers[$i-1]}
done
echo ${massive[@]}
echo ${chair_numbers[@]}
exit 0


