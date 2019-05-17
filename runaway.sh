#!/bin/sh
top -b -n 1 > top.txt
filename=top.txt
counter1=0
counter2=0
pid=""
user=""
time=""
while read line; do
  if [ "$counter1" -gt 6 ]
  then
    counter2=0
    for word in $line
    do
      if [ "$counter2" -eq 0 ]
      then
        pid="$word"
        #echo "$word"
      fi
      if [ "$counter2" -eq 1 ]
      then
        user="$word"
        #echo "$word"
      fi
      if [ "$counter2" -eq 10 ]
      then
        time="$word"
        #echo "$word"
      fi
      if [ "$counter2" -eq 11 ]
      then
        if [[ "$user" != "root" ]]
        then
          if [[ "$time" > "2:00.00" ]]
          then
            #echo "$time"
            #echo "$line"
            kill -9 "$pid"
            echo "Killing process with pid: $pid"
          fi
        fi
      fi
      counter2=$((counter2+1))
    done
  else
    counter1=$((counter1+1))
    #echo "$line"
  fi
done < $filename
