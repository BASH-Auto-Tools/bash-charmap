#!/bin/bash

tlocale=$(echo "${LANG//*.}")

printf "\n$tlocale\t\tConsole CharMap\t\t0.20180108\n"

hb=$1
[[ -z $hb ]] && hb=0
printf -v xb "%d" "0x$hb"


if [[ "$tlocale" = "UTF-8" ]]
then
    for ii in {0..2047}
    do
        if [[ $ii -eq 0 || $(((ii+xb)%64)) -eq 0 ]]
        then
            printf "\n%04x: " $((ii+xb))
        fi
        printf -v hb "%x" $((ii+xb))
        printf "\u$hb"
    done
else
    for ii in {0..255}
    do
        if [[ $ii -eq 0 || $(((ii)%64)) -eq 0 ]]
        then
            printf "\n%04x: " $((ii))
        fi
        printf -v hb "%x" $((ii))
        printf "\u$hb"
    done
fi
printf "\n"
