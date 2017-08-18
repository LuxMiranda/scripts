#!/bin/bash

# A lightweight tool for telling you how long you've been at work
# Original author: Dave Browning
# Modifications by Jack Kiefer

month=$(date | cut -d' ' -f2)
day=$(date | cut -d' ' -f3)

curDate="$month $day"

echo "It is $curDate"

# Get the time the machine booted this morning
arrivalTime=$(last -w $USER | grep "$curDate" | tail -n1 | tr -s ' ' | cut -d' ' -f7)


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

exit

