#!/bin/bash

start=0900

item=image/img_${start}.jpg
array=($item)

for img in `ls image/img_*.jpg`
do
    [[ $img > $item ]] && array[${#array[@]}]=$img
done
count=${#array[@]}

rotate_y=0
rotate_y_step=`expr 360 / $count`
gen_code() {
    img=$1
    echo ".step(data-x='-2000' data-y='1400' data-z='-10000' data-rotate-x='90' data-rotate-y='${rotate_y}')"
    echo "  img(src='${img}')"
    let rotate_y=rotate_y+rotate_y_step
}

for img in ${array[@]}
do
    gen_code $img
done
