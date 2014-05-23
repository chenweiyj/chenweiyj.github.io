#!/bin/bash

current=`pwd`
srcdir=imageo
destdir=image

cd ${current}/${srcdir}
for src in *.JPG
do
    echo $src
    convert -quality 75 -scale 50% $src \
        -gravity SouthEast -font Courier-bold -fill SlateBlue1 \
        -pointsize 48 -annotate +50+50 'chenweiyj.github.io' ${current}/${destdir}/$src
done
cd ${current}
