#!/bin/bash

msgId=50013

if [ "$1" == "first_child" ]
then
  bspc config automatic_scheme first_child
  dunstify -u normal -r $msgId -t 2000 "Switched to first_child mode!"
  exit 0
elif [ "$1" == "longest_side" ]
then
  bspc config automatic_scheme longest_side
   dunstify -u normal -r $msgId -t 2000 "Switched to longest_side mode!"
  exit 0
elif [ "$1" == "spiral" ]
then
  bspc config automatic_scheme spiral
  dunstify -u normal -r $msgId -t 2000 "Switched to spiral mode!"
  exit 0
else
  dunstify -u normal -r $msgId -t 2000 "Invalid mode!"
  exit 1
fi

