#!/bin/bash

#read input data 1
read -p "Please write first string: " -r
#split the string into characters
declare -a string
while IFS="" read -r -n 1 c; do
  #  -r	сырой ввод - отключает интерпретацию , backslash escapes  и символов продолжения строки в считываемых данных
  #  -n <NCHARS>	число, считывает <NCHARS> символов ввода и выходит.
  string+=("$c")
done <<<$REPLY
#REPLY - переменная по-умолчанию, куда записывается ввод пользователя,
#выполненный с помощью команды read если явно не задана другая переменная.

#read input data 2
read -p "Please write second string: " -r
#split the string into characters
while IFS="" read -r -n 1 c; do
  string+=("$c")
done <<<$REPLY
#sort string
readarray -td '' sort_str < <(printf '%s\0' "${string[@]}" | sort -z -u)
#readarray - cчитывание строк из файла в переменную массива (то же самое, что и read -a).
#readarray -t eдаляет завершающую разделительную черту (по умолчанию новая строка) из каждой прочитанной строки.
#readarray -d означает, что для завершения каждой строки ввода используется первый символ delim, а не newline.
#и мы можем объединять опции, поэтому вместо "-t -d" можно написать "-td"
#printf '%s' — печатает аргумент в виде строки.
#\0 в printf означает, что после печати символа будет подставлен конец строки, вместо стандарного пробела.
#write string
for i in ${sort_str[@]}; do
  echo -n $i
done
echo
exit 0