#!/bin/sh
SOURCE=$(pmset -g batt | head -n1)
if [ "$SOURCE" = "Now drawing from 'AC Power'" ]; then
    SOURCE="to charge"
else
    SOURCE="to empty"
fi

PERCENT=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')
LEFT=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $4 }')
echo "${PERCENT} | ${LEFT} ${SOURCE}"
