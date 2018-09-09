#!/bin/bash
n=$(date +"%e" | xargs)

ord="th"

if [ $n -ge 11 -a $n -le 13 ] ; then
  ord="th"
else
  case $(( $n%10 )) in
  1)
    ord="st"
    ;;
  2)
    ord="nd"
    ;;
  3)
    ord="rd"
    ;;
  *)
    ord="th"
    ;;
  esac
fi

echo $(date +"%A, $n$ord of %B, %Y")
