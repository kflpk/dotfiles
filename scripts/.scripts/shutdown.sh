#!/bin/sh
CHOICE=$(echo "Back\nShutdown\nReboot" | rofi -dmenu -p "Whatcha wanna do?")
if [ $CHOICE = "Yes" ]
then
  shutdown now
else
  echo "rzujmi"
fi
case $CHOICE in
	Reboot)
		reboot	
		;;
	Shutdown)
		shutdown now
		;;
	Back)
		/home/kacper/.scripts/menu.sh
		;;
	*)
esac

