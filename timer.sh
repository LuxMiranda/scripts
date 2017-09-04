#!/usr/bin/env bash

spinner="\-/|"
arg=$1
printf "\n\n"
for ((i=arg; i > 0; --i)); do
  sleep 1;
  if (( i < 10 )); then
    printf "\r0$i..${spinner:$(($i % 4)):1}";
  else
    printf "\r$i..${spinner:$(($i % 4)):1}";
  fi
done;
printf "\nFinished!\n"

exit
