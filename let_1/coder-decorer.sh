#!/bin/bash

#checking input arguments
if [ $# -eq 0 ]; then
  echo "pls write smth"
  exit 1
fi

#проверим введена ли команда
if [ $# -eq 1 ]; then
  echo "pls write command (-c to code and -d to decode)"
  exit 1
fi

#разобьём строку на отдельные цифры
declare -a string
while IFS="" read -r -n 1 c; do
  string+=("$c")
done <<<$2

if [ $1 = "-c" ]; then
  for i in ${string[@]}; do
    #функция перевода в двоичную систему счисления
    D2B=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
    #это создаёт массив с 00000000 00000001 ... 11111110 11111111 с расширением bash`s.
    #Позиция в массиве D2B представляет её десятичное значение
    #чтобы удалить начальные нули нужно добавить 10# перед вызовом функции
    #переменная, хранящая двоичный вид числа
    binary=$((10#${D2B[$i]}))
    #цикл записи нулей и единиц перед самим числом (пункт b)
    for ((j = 1; j < ${#binary}; j++)); do
      result+=(0)
    done
    result+=(1)
    result+=(${binary})
  done
elif [ $1 = "-d" ]; then
  counter=0
  for i in ${string[@]}; do
    if (((($i == "0")) && (($flag != 1)))); then
      counter=$counter+1
    elif (((($i == "1")) && (($flag != 1)))); then
      counter=$counter+1
      flag=1
    else
      if (($counter == 0)); then
        flag=0
      else
        binary_number+=($i)
        counter=$counter-1
      fi
    fi
    if (( $counter == 0 )); then
      result+=$((printf "ibase=2;${binary_number[@]}" | bc))

      fi
  done
else
  echo "unknown command (write -c to code and -d to decode)"
  exit 1
fi
for i in ${result[@]}; do
    echo -n $i
  done
echo
exit 0
