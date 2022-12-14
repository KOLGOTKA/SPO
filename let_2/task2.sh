#!/bin/bash

letters=()
#fill array witn input data
i=0
for leteral in $*; do
	letters[$i]=$leteral
	i=$i+1
done

#check input arguments
if (( ${#letters[@]} == 0)); then
	echo "z"
	exit 0 
fi

res=0
#find the summ of the letter code

#Спецификаторы преобразования типа printf (это символ, каторый определяет, как интерпретировать соотвествуюший агумент)
#Они бывают следующих типов:
#%b — Распечатайте аргумент, расширяя escape — последовательности обратной косой черты.
#%q — Вывести аргумент в кавычках, многократно используемый в качестве ввода.
#%d, %i- Печать аргумента как десятичное целое.
#%u — Вывести аргумент в виде десятичного целого числа без знака.
#%o — Вывести аргумент в виде восьмеричного целого без знака.
#%x, %X — Вывести аргумент в виде шестнадцатеричного целого числа без знака. %x печатает строчные буквы и %X печатает прописные.
#%e, %E — Вывести аргумент в виде числа с плавающей запятой в экспоненциальной записи. %e печатает строчные буквы и %E печатает прописные.
#%a, %A — Вывести аргумент в виде числа с плавающей запятой в шестнадцатеричной дробной записи. %a печатает строчные буквы и %A печатает прописные.
#%g, %G — Вывести аргумент в виде числа с плавающей точкой в обычной или экспоненциальной записи, в зависимости от того, что больше подходит для данного значения и точности. %g печатает строчные буквы и %G печатает прописные.
#%c — Распечатать аргумент в виде одного символа.
#%f — Распечатайте аргумент как число с плавающей точкой.
#%s — Распечатать аргумент в виде строки.
#%% — Напечатайте буквальный символ %.

for ((i = 0; i < ${#letters[@]}; i++)); do
	code=$(printf "%d" "'${letters[$i]}'")
#  Параметр для printf после обязательного указания спецификатора преобразования указывается в двойных кавычках (""),
#  однако заключение в эти кавычки, сохраняет буквальное значение всех символов внутри, кроме $,`,\ и !. В свою очередь
#  заключение в одиночные кавычки ('') сохраняет буквальное значение каждого символа внутри кавычек. И так как мы не хотим,
#  чтобы сохранялось специальное значение символа $, нам необходими заключить его в ''
	res=$(( $res + $code - 96 ))
done

over=0
#check overfilling
if (( $res/25 > 0 )); then
	over=1
fi
final_code=$(( $res % 26 + 96))

if (( $over == 1)); then
	printf "\\$(printf '%03o' "$final_code")"
	#"printf '%03o'" означает, что мы преобразовываем
	# тип переменной 3-значное восьмиричное число
	#printf \\$(...) печатает символ, представленный восьмеричным значением
	echo " //overfilling"
else {
	printf "\\$(printf '%03o' "$final_code")"
	echo
} fi
exit 0
