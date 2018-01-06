#!/bin/bash

printf "\n\t\tConsole CharMap\t\t0.20180105\n"

hb=$1
[[ -z $hb ]] && hb=0
printf -v xb "%d" "0x$hb"

for ii in {0..2047}
do
    if [[ $ii -eq 0 || $(((ii+xb)%64)) -eq 0 ]]
    then
        printf "\n%04x: " $((ii+xb))
    fi
    printf -v hb "%x" $((ii+xb))
    printf "\u$hb"
done
printf "\n"
