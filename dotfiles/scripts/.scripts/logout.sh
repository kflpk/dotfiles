#!/bin/sh
yesno=$(echo "No\nYes" | rofi -dmenu -p "Log out?")
if [ $yesno = "Yes" ]
then
	gnome-session-quit --force
else
	echo "Cancelled"
fi
