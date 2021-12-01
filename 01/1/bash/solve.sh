#!/bin/bash
readarray -t INPUT < ../input.txt

LASTDEPTH=-1
i=0

for n in ${INPUT[@]:245:10}
do
    if [ "$n" -gt "$LASTDEPTH" ]; then
        if [ "$LASTDEPTH" -ne "-1" ]; then
            ((i=i+1))
            echo "+ ${n} ~${i}"
        fi
    else
        echo "= ${n}"
    fi
    LASTDEPTH=$n
done

echo $i