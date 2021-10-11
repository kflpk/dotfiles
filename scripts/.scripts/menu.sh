#!/bin/sh

choice=$(echo "Reload
Display
Lockscreen
Suspend
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
    Suspend)
		slock &
		sleep 1s
		/bin/systemctl suspend
        ;;
    Shutdown)
        /home/kacper/.scripts/shutdown.sh
        ;;
    *)
esac

