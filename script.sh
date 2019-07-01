#! /bin/bash
set -e

img=$1
text=$2
size=$3

if [ -z "$img" ]
then
    echo "[File][text][textsize]"
    exit 0
fi

if [ -z "$size" ] || [ -z "$text" ]
then 
    echo "Missing arguments"
    exit 0
fi


newImg="PlaylistImage$img"
cp $img $newImg

convert $newImg -level 2%,98%,0.5 \
        -resize 640x640 \
        -gravity Center \
        -pointsize $size \
        -fill white \
        -font Proxima-Nova-Alt-Bold \
        -annotate 0 $text \
        $newImg

echo $newImg
exit 1
