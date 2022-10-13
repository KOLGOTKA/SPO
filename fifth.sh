#!/bin/bash

var=$1
let height=($var/2)
let i=0
while [ $i -le $var ]
do
	let width=($var - $i * 2 + 1)
	if [ $width -lt 0 ]
	then
		let a=(-$width/2)
	else
		let a=($width/2)
	fi
	let j=0
	while [ $j -lt $a ]
	do
	       echo -n " "
	       let j=$j+1
	done
	let k=0
	let value=($var - 2 * $a)
	while [ $k -lt $value ]
	do

		echo -n "."
		let k=$k+1
	done
	let j=0
	while [ $j -lt $a ]
	do
		echo -n " "
		let j=$j+1
	done
	let i=$i+1
	echo
done
		

exit 0
