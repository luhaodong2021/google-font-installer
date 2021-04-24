#!/bin/bash
# This shell script is used to install font on Ubuntu,move this file to the dir of your font file to install the font
# sudo ./google-font-installer <filename>
if [ $1 == ""];then
    echo "Expected font file name"
    exit 
fi
if [ -f  $1 ];then
    workpath=$(dirname $(readlink -f $0))
    string=$1
    dirname=${string/".zip"/""}
    cd /usr/share/fonts
    mkdir $dirname
    cd $dirname 
    unzip -d . $workpath/$1
    chmod -R --reference=/usr/share/fonts/opentype /usr/share/fonts/$dirname
    fc-cache -fv
else
    echo "File $1 not exist!"
fi
