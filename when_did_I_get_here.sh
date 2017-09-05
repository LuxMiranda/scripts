#!/bin/bash

# A lightweight tool for telling you how long you've been at work
# Authored by David Browning and Jack Kiefer

month=$(date | tr -s ' ' | cut -d' ' -f2)
day=$(date | tr -s ' ' | cut -d' ' -f3)

curDate="$month $day"

echo "It is $curDate"
echo ""

# Get the time the machine booted this morning
arrivalTime=$(last -w $USER | tr -s ' ' | grep "$curDate" | tail -n1 | tr -s ' ' | cut -d' ' -f7)


TIME1="$arrivalTime:00"

# Get the current time

TIME2=$(date +"%T")

# Convert the times to seconds from the Epoch
SEC1=`date +%s -d ${TIME1}`
SEC2=`date +%s -d ${TIME2}`

# Use expr to do the math, let's say TIME1 was the start and TIME2 was the finish
DIFFSEC=`expr ${SEC2} - ${SEC1}`

echo The first recorded login today was at ${TIME1}
echo It is currently ${TIME2}

# And use date to convert the seconds back to something more meaningful
elapsed=$(date +%H:%M:%S -ud @${DIFFSEC})

# Make it pretty

h=$(echo $elapsed | cut -d':' -f 1)
m=$(echo $elapsed | cut -d':' -f 2)
s=$(echo $elapsed | cut -d':' -f 3)

echo It has been $h hours, $m minutes, and $s seconds

if ! [ -z "$1" ]
  then
    TOSECDEC=$(echo "${1} * 3600" | bc)
    TOSEC=$(echo $TOSECDEC | cut -f1 -d".")
    LEAVESEC=`expr ${SEC1} + ${TOSEC}`

    if [ $SEC2 -gt $LEAVESEC ]
      then
        echo ""
        echo "You have already met your goal of $1 hours!!"
        exit
    fi

    SECTOGO=`expr ${LEAVESEC} - ${SEC2}`
    togo=$(date +%H:%M:%S -ud @${SECTOGO})

    th=$(echo $togo | cut -d':' -f 1)
    tm=$(echo $togo | cut -d':' -f 2)
    ts=$(echo $togo | cut -d':' -f 3)

    echo ""
    echo To reach your target of $1 hours you have
    echo $th hours, $tm minutes, and $ts seconds to go

fi

exit

