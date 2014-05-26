#!/bin/bash

current=`pwd`
srcdir=imageo
srcpath=${current}/${srcdir} 
destdir=image
destpath=${current}/${destdir}
watermark=chenweiyj.github.io

test -d ${destpath} && rm -r ${destpath}
mkdir ${destpath}

cd ${srcpath}
for src in *.jpg
do
    # scale: 80% pointsize: 48 annotate: +50+50
    # scale: 50% pointsize: 32 annotate: +30+30
    #echo $src
    convert -quality 75 -scale 50% $src \
        -gravity SouthEast -font Courier-bold -fill SlateBlue1 \
        -pointsize 32 -annotate +30+30 "${watermark}" ${destpath}/$src
done

tsukuba=tsukuba.jpg
convert -quality 75 ${tsukuba} \
    -gravity SouthEast -font Courier-bold -fill SlateBlue1 \
    -pointsize 24 -annotate +30+30 "${watermark}" ${destpath}/${tsukuba}

for src in *.png
do
    #echo $src
    filename="${src%.*}".jpg
    convert -quality 75 $src \
        ${destpath}/${filename}
done

cd ${current}
