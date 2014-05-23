#!/bin/bash

current=`pwd`
srcdir=imageo
destdir=image
watermark=chenweiyj.github.io

cd ${current}/${srcdir}
for src in *.JPG
do
    # scale: 80% pointsize: 48 annotate: +50+50
    # scale: 50% pointsize: 32 annotate: +30+30
    echo $src
    convert -quality 75 -scale 50% $src \
        -gravity SouthEast -font Courier-bold -fill SlateBlue1 \
        -pointsize 32 -annotate +30+30 "${watermark}" ${current}/${destdir}/$src
done
cd ${current}
