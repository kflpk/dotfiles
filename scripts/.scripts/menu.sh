#!/bin/sh

choice=$(echo "Reload
Display
Lockscreen
Logout
Shutdown" | rofi -dmenu -p "What do?" -i)
case $choice in
    Reload)
        /home/kacper/.scripts/reload
        ;;
    Display)
        /home/kacper/.scripts/display.sh
        ;;
    Lockscreen)
	slock
        ;; 
    Logout)
        /home/kacper/.scripts/logout.sh
        ;;
    Shutdown)
        /home/kacper/.scripts/shutdown.sh
        ;;
    *)
esac

