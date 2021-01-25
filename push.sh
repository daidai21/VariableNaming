#!/bin/bash

# set -x # for debug
set -e # when meet err, exit now.


tmp=`sort README.md | uniq -c | awk '{print $1}' | sort | uniq | wc -l`
if [ $tmp != 1 ]
then
    echo "VN duplicate!!!"
    echo "===== repeat line: ====="
    sort README.md | uniq -c | grep -v "1"
    echo "===== ====="
    echo "So, quit."
    exit 1
fi


git add .
git commit -m "."
git push origin master

