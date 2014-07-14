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
data_xo=-1000
data_yo=2000
data_x=$data_xo
data_y=$data_yo
step_x=900
step_y=700
acc=0
gen_code() {
    img=$1
    echo ".step(data-x='${data_x}' data-y='${data_y}' data-z='-1000')"
    echo "  img(src='${img}')"
    #let rotate_y=rotate_y+rotate_y_step
    let data_x=data_x+step_x
    let acc=acc+1
    if [ $acc -ge 10 ]; then
        let data_y=data_y+step_y
        data_x=$data_xo
        acc=0
    fi
}

for img in ${array[@]}
do
    gen_code $img
done
