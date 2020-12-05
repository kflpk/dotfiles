#!/bin/sh
yesno=$(echo "No\nYes" | rofi -dmenu -p "Restart session?")
if [ $yesno = "Yes" ]
then
	echo "somethin"
else
	echo "Cancelled"
fi
