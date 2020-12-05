#!/bin/sh

monitor=$(echo "Acer\nBoth\nMirror" | rofi -dmenu -p "Choose the display")
case $monitor in
    Acer)
        xrandr --output "DVI-D-1" --off
        ;;
    Both)
        xrandr --output "DVI-D-1" --auto
        xrandr --output "HDMI-0" --auto --primary --output "DVI-D-1" --left-of "HDMI-0"
        ;;
    Mirror)
        xrandr --output "DVI-D-1" --auto
        xrandr --output "HDMI-0" --auto --primary --output "DVI-D-1" --same-as "HDMI-0"
        ;;
    *)
esac
