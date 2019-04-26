#!/bin/bash
path=$(find -name lab2-test)
date=$(date +"%m-%d-%y %T")
if [ -e "$path" ]; then
    echo "${date} ${time}- File \"${path}\" has been found" >> uptime.log
else
    if [ 
    echo "${date} ${time}- File \"${path}\" has been lost" >> uptime.log
fi
