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
let height=$var
#define the number of spaces
let space=$(($var-1))
#output for one item
if (($var == 1)); then
	echo "◊"
	exit 0
fi
#print first part of romb
for (( i = 0; i < $var; i++)); do
	#print spaces
	for ((j = 0; j < $space; j++)); do
		echo -n " "
	done
	#print simbols
	for ((j = 0; j < $(( $var-$space )); j++)); do
		if (( $j == 0 )); then
			if (( $i == 0 )); then
				#print head
				echo -n " ∆"
			elif (( $i == $(( $var-1 )) )); then
				#print the side
				echo -n "〈"
			else
				#print borders
				echo -n " /"
			fi
		elif (( $j == $(( $var-$space-1 )) )); then
			if (( $i == $(( $var-1 )) )); then
				#print the side
                        	echo -n " 〉"
			else
				#print borders
				echo -n " \\"
			fi
		else
			#print body
			echo -n " ¤"
		fi
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
                if [[ $j == 0 ]]; then
			if (( $i == $(( $var-2 )) )); then
				#print tale
                                echo -n " v"
                        else
				#print borders
                                echo -n " \\"
                        fi
                elif [[ $j == $(( $var-$space-1 )) ]]; then
			#print borders
                        echo -n " /"
                else
			#print body
                        echo -n " ¤"
                fi

        done
        #reducing the number of spaces
        space=$(( $space+1 ))
        echo
done
exit 0
