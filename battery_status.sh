#!/bin/sh
PERCENT=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')
LEFT=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $4, "left" }')
echo "${PERCENT} | ${LEFT}"
