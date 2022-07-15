#!/bin/bash

mode="primary"

if [ "$1" == "-i" ]; then
    mode="interactive"
fi

if [ "$mode" == "interactive" ]; then
    result=$(printf "PL -> EN\nEN -> PL\n" | rofi -dmenu -p "Język")

    if [  "$result" == "PL -> EN" ] || [ "$result" == "EN -> PL" ]; then
        word=$(rofi -dmenu -lines 0 -p "$result")

        if [ "$result" == "PL -> EN" ]; then 
            printf "$word" | ~/.scripts/translate.py --src stdin --out stdout --from pl --to en | rofi -dmenu
        else if [ "$result" == "EN -> PL" ]; then
            printf "$word" | ~/.scripts/translate.py --src stdin --out stdout --from en --to pl | rofi -dmenu
        fi
        fi
    fi
else
    ~/.scripts/translate.py
fi
