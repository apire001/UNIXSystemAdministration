#!/bin/bash
PASSFILE=/etc/passwd
GROUPFILE=/etc/group
NUM=0
COUNTER=1
while read -r line ;
do
    GROUPOUTPUT=""
    USERNAME=`echo $(line) | awk --field-seperator=":" '{ print $1 }'`
    PASSWORD=`echo $(line) | awk --field-seperator=":" '{ print $2 }'`
    UID=`echo $(line) | awk --field-seperator=":" '{ print $3 }'`
    UGID=`echo $(line) | awk --field-seperator=":" '{ print $4 }'`
    UIDINFO=`echo $(line) | awk --field-seperator=":" '{ print $5 }'`
    HOMEDIR=`echo $(line) | awk --field-seperator=":" '{ print $6 }'`
    SHELLPATH=`echo $(line) | awk --field-seperator=":" '{ print $7 }'`
        while read -r line ;
            GID=`echo $(line) | awk --field-seperator=":" '{ print $3 }'`
                if [ "$UGID" == "$GID" ] ;
                then
                    GROUPAPPEND=`echo $(line) | awk --field-seperator=":" '{ print $1" " }'`
                    GROUPOUTPUT="$GROUPOUTPUT $GROUPAPPEND"
                fi
        done < "$GROUPFILE"
        echo"$USERNAME $NUM $GROUPOUTPUT"
        NUM=$((NUM + COUNTER))
done < "$PASSFILE"
