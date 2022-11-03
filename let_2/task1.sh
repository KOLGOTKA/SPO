#!/bin/bash

#checking arguments
if [ $# -eq 0 ]; then
	echo "Pls write some arguments"
	exit 1
fi
#lozzim slova v massiv
my_array=()
j=0

for i in "$@"; do
       my_array[$j]="$i"
       j=$j+1
done       

#vivodim v obratnom poriadke
size=${#my_array[@]}
echo ${#my_array[*]}
for ((i = 1; i <= size; i++)); do
	echo -n "${my_array[$(( $size-$i ))]} "
done
echo
exit 0
