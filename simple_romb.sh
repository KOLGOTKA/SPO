#!/bin/bash
#checking for input arguments
if [ $# -eq 0 ]; then
	echo "Pls write some arguments"
	exit 1
fi
#checking imput
if ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo "\"$1\" not correct number"
	exit 1
fi
var=$1
#define the number of spaces
let space=$(($var-1))
#print first part of romb
for (( i = 0; i < $var; i++)); do
	#print spaces
	for ((j = 0; j < $space; j++)); do
		echo -n " "
	done
	#print simbols
	for ((j = 0; j < $(( $var-$space )); j++)); do
			#print body
			echo -n " *"
	done
	#reducing the number of spaces
	space=$(( $space-1 ))
	echo
done
#now we start with one space and increase
space=1
#print second part of romb
for (( i = 0; i < $(( $var-1 )); i++ )); do
	#print spaces
        for ((j = 0; j < $space; j++)); do
                echo -n " "
        done
        #print simbols
        for ((j = 0; j < $(( $var-$space )); j++)); do
			#print body
                        echo -n " *"
        done
        #reducing the number of spaces
        space=$(( $space+1 ))
        echo
done
exit 0
