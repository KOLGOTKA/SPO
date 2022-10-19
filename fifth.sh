#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Pls write some arguments"
	exit 1
fi

var=$1
let height=($var/2)
let i=1
parity=0
if (( $var % 2 == 0 )); then
	parity=1
	var=$(( $var+1 ))
fi
while [ $i -le $var ]; do
	let width=($var - $i * 2 + 1)
	if [ $width -lt 0 ]; then
		let a=(-$width/2)
	else
		let a=($width/2)
	fi
	let j=0
	while [ $j -lt $a ]; do
	       echo -n " "
	       let j=$j+1
	done
	let k=0
	let value=$(( $var - 2 * $a ))
	var_2=$(( $var/2+1 ))
	value_2=$(( $value/2 ))
	while [ $k -lt $value ]; do
		if [ $i == $var_2 ] && [ $k == $value_2 ] && [ $parity == 1 ]; then
			echo -n "@"
		else
			echo -n "$"
		fi
		let k=$k+1
	done
	let j=0
	while [ $j -lt $a ]; do
		echo -n " "
		let j=$j+1
	done
	let i=$i+1
	echo
done
exit 0
