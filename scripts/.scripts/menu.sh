#!/bin/sh

choice=$(echo "Display\nLockscreen\nRestart-session\nLogout\nShutdown" | rofi -dmenu -p "What do?" -i)
case $choice in
    Display)
        /home/kacper/.scripts/display.sh
        ;;
    Lockscreen)
        gnome-screensaver-command -l
        ;;
    Restart-session)
        /home/kacper/.scripts/restart-session.sh
        ;;
    Logout)
        /home/kacper/.scripts/logout.sh
        ;;
    Shutdown)
        /home/kacper/.scripts/shutdown.sh
        ;;
    *)
esac

