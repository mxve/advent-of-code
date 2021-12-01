#!/bin/bash
readarray -t INPUT < ../input.txt

LASTDEPTH=-1
i=0
WINDOWS=()

for n in ${INPUT[*]}
do
    if [[ ${INPUT[$i]} ]] && [[ ${INPUT[$i+1]} ]] && [[ ${INPUT[$i+2]} ]]; then
        sum=$((${INPUT[$i]} + ${INPUT[$i+1]} + ${INPUT[$i+2]}))
        WINDOWS+=($sum)
    fi
    ((i=i+1))
done

LASTWINDOW=-1
i=0
for n in ${WINDOWS[*]}
do
    if [ "$n" -gt "$LASTWINDOW" ]; then
        if [ "$LASTWINDOW" -ne "-1" ]; then
            ((i=i+1))
        fi
    fi
    LASTWINDOW=$n
done

echo $i