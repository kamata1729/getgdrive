#!/bin/bash
# $1 is public id of the google drive file 
# $2 is the output name

if [ $# -ne 2 ]; then
    echo 'require $1(file id) and $2(output name)'
    exit 1
fi

command curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=$1" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
command curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=$1" -o $2

exit 0