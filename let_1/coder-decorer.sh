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
  flag=0
  for i in ${string[@]}; do
    if ((flag)); then
      if (($counter != 0)); then
        str=$str$i
        counter=$(($counter - 1))
      fi
      if (($counter == 0)); then
        flag=0
        num=$(($str))
        str=""
        result=$result$(echo "ibase=2;$num" | bc)
      fi
    else
      counter=$(($counter + 1))
      if (($i == "1")); then
        flag=1
      fi
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
