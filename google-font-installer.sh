#!/bin/bash
# install google font on Ubuntu,tested on Ubuntu20.04
# sudo ./google-font-installer <filepath>
if [ $1 == ""];then
    echo Usage : $0 "<filepath>"
    exit 
fi    
if [ -f  $1 ];then
    workpath=$(dirname $(readlink -f $0))
    para=$1
    if [ ${para##*.} != "zip"];then
        echo Expect zip file
        exit
    fi
    dirname=${para##*/}
    dirname=${dirname%.zip}
    cd /usr/share/fonts
    mkdir $dirname
    cd $dirname 
    unzip -d . $workpath/$1
    chmod -R --reference=/usr/share/fonts/opentype /usr/share/fonts/$dirname
    fc-cache -fv
else
    echo "File $1 not exist!"
fi
