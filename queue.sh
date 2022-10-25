#!/bin/bash

#checking input arguments
if [ $# -eq 0 ]; then
	echo "pls whrite number of chairs"
	exit 1
fi

size=$1
#let size_1=( $size - 1 )
#let size_2=( $size - 2 )
#declare two arrays
#one keeps the numbers of the chairs
declare -a chair_numbers
#the second one will record the patient sequence numbers
declare -a massive
#fill the first array with chair numbers
for ((i=0;i<size;i++)); do
	let a=$i+1
	chair_numbers[$i]=$a
done
#fill the second one with NULL
for ((i=0;i<size;i++)); do
	massive[$i]=0
done
#advance that the first patient sits on the first chair and the second on the last
massive[0]=1
massive[$(( $size - 1 ))]=2
#start the cycle of determining the chairs numbers of patients starting fro the third
for ((i=3;i<=size;i++)); do
	#patient space metre
	counter=0
	#the position of patient`s before the gap
	pos_1=0
	#the position of patient`s after the gap
	pos_2=0
	#maximum space length
	max_length=0
		#cycle for determing the maximum length of the gap and position of patients from the sides of the gap
		for ((j=1;j<size;j++)); do
		if [[ ${massive[$j]} == 0 ]]; then
			let counter=$counter+1
		else
			if [[ $counter>$max_length ]]; then
				pos_1=$pos_2
				max_length=$counter
			fi
			pos_2=$j
			counter=0
		fi

	done
	#position of new patient
	pacient_pos=0
	if (( $max_length % 2 == 0 )); then
		pacient_pos=$(( $pos_1 + $max_length / 2 ))
	else
		pacient_pos=$(( $pos_1 + 1 + $max_length / 2 ))
	fi
	#write the position of the new patien in the array
	massive[$pacient_pos]=${chair_numbers[$i-1]}
done
#display all the elements of the patient and the chairs array
echo ${massive[@]}
echo ${chair_numbers[@]}
exit 0


