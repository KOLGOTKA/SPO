#!/bin/bash

#фунция смены двух элементов местами
swap() {
  tmp=${phrase[$1]}
  phrase[$1]=${phrase[$2]}
  phrase[$2]=$tmp
}

#функция изменения регистра
#она получает в себя номер слова в фразе, которое будем менять и команду "up" или "down"
regChange() {
  #массив для хранения символов из текущей строки
  while read -r -n 1 c; do
    word+=("$c")
  done <<<${phrase[$1]}
  for ((j = 0; j < ${#word[@]}; j++)); do
    #получаем код символа
    code=$(printf "%d" "'${word[$j]}'")
    #и если он является прописной буквой и не получена команда понижения региста, то повышаем
    #регистр вычитанием числовой разницы между такой же заглавной буквой в таблице ASCII
    if (( $code >= 97 && $code <= 122 )); then
      if [ $2 != "down" ]; then
        word[$j]=$(printf "\\$(printf '%03o' "$(( $code - 32 ))")")
      fi
    #и если он является заглавной буквой и не получена команда повышения региста, то понижаем
    #регистр вычитанием числовой разницы между такой же прописной буквой в таблице ASCII
    elif (( $code >= 65 && $code <= 90 )); then
      if [ $2 != "up" ]; then
        word[$j]=$(printf "\\$(printf '%03o' "$(( $code + 32 ))")")
      fi
    fi
  done
  #переписываем наш изменённый массив в стороку и возвращаем её в фразу
  tmp=""
  for j in ${word[@]}; do
    tmp=$tmp$j
  done
  phrase[$1]=$tmp
  word=()
}

read -p "Please write your phrase: " -r -a phrase

for (( i = 0; i < ${#phrase[@]}; i++ )); do
  #если элемент нечетный
  if ((i % 2)); then
    if (( ${#phrase[$i]} < ${#phrase[$(($i + 1))]} )); then
      #если не выдолняется условие P, то меняем местами текущий и следующий
      swap $i $(($i + 1))
    fi
    #затем повышаем регистр
    regChange $i up
  #если элемент четный
  else
    if (( ${#phrase[$i]} > ${#phrase[$(($i + 1))]} )); then
      #если не выдолняется условие P, то меняем местами текущий и следующий
      swap $i $(($i + 1))
    fi
    #затем понижаем регистр
    regChange $i down
  fi

done

for i in ${phrase[@]}; do
  echo $i
done
exit 0
