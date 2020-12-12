#!/bin/sh
yesno=$(echo "No\nYes" | rofi -dmenu -p "Lock the screen?")
if [ $yesno = "Yes" ]
then
	slock
else
	echo "Cancelled"
fi
