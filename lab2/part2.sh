#!/bin/bash
awk -F':' '{ print $1 }' /etc/passwd > usernames.txt
awk -F':' '{ print $3 }' /etc/passwd > userids.txt
temp=1
counter=1
numusers=$(cat usernames.txt | wc -l)
while [ $counter -le $numusers ]
do
    username=$(sed -n "${counter}p" < usernames.txt)
    uid=$(sed -n "${counter}p" < userids.txt)
    grep "$username" /etc/group > usergroups.txt
    echo -n "$username"
    echo -n " "
    echo -n "$uid"
    numgroups=$(cat usergroups.txt | wc -l)
    groupcounter=1
    while [ $groupcounter -le $numgroups ]
    do
        sed -n "${groupcounter}p" < usergroups.txt > currgroup.txt
        currgroup=$(awk -F':' '{ print $1 }' currgroup.txt)
        ((groupcounter=groupcounter + 1))
        echo -n " "
        echo -n "$currgroup"
    done
    echo ""
    ((counter=counter + 1))
done
rm usernames.txt
rm userids.txt
rm usergroups.txt
rm currgroup.txt
