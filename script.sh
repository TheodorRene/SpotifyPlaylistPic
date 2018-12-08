#! /bin/bash

img=$1
text=$2

cp $img "PlaylistImage$img"
newImg="PlaylistImage$img"


#Adding constrast
resolution=$(identify $newImg | awk '{print $4}')
#echo $resolution

echo $newimg 
convert $newImg -level 2%,98%,0.5 \
        -crop '640x640+5+10' \
        $newImg 

#echo $(identify $newImg | awk '{print $4}')

echo $newimg

convert $newImg \
        -gravity Center \
        -pointsize 72 \
        -fill white \
        -font Proxima-Nova-Alt-Reg \
        -annotate 0 $text \
        $newImg
        #-draw "text 0,0 'Gode minner'" \

echo $newImg
sleep 1
yad --width 300 --image=$newImg;




   
