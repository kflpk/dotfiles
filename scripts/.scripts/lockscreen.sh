#!/bin/sh
yesno=$(echo "No\nYes" | rofi -dmenu -p "Lock the screen?")
if [ $yesno = "Yes" ]
then
	gnome-screensaver-command -l
else
	echo "Cancelled"
fi
