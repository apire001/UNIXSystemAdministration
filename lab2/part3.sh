#!/bin/bash
log=$(find /home/andy/lab2 -name 'uptime.*')
if [ -e "$log" ]; then
    awk 'NF>1{print $NF}' uptime.log > temp.txt
    line=$(cat temp.txt | wc -l)
    lastword=$(sed -n ${line}p < temp.txt)
    rm temp.txt
fi
found="found"
lost="lost"
path=$(find /home/andy/lab2 -name lab2-test)
date=$(date +"%m-%d-%y %T")
if [ -e "$path" ]; then
    if [ "$lastword" != "$found" ]; then
        echo "${date} ${time}- File \"lab2-test\" has been found" >> /home/andy/lab2/uptime.log
    fi
else
    if [ "$lastword" != "$lost" ]; then
        echo "${date} ${time}- File \"lab2-test\" has been lost" >> /home/andy/lab2/uptime.log
    fi
fi
