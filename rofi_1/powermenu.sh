#!/bin/bash

options="Shutdown\nReboot\nLogout\nLock"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power")

case "$chosen" in
    Shutdown)
        confirm=$(echo -e "No\nYes" | rofi -dmenu -p "Are you sure?")
        if [ "$confirm" = "Yes" ]; then
            systemctl poweroff
        fi
        ;;
    Reboot)
        confirm=$(echo -e "No\nYes" | rofi -dmenu -p "Reboot system?")
        if [ "$confirm" = "Yes" ]; then
            systemctl reboot
        fi
        ;;
    Logout)
        i3-msg exit
        ;;
   Lock)
        # Path to your desired lockscreen wallpaper
        WALLPAPER="/home/saptak/wallpaper/wall/sakura-trees-over-river.jpg"

        i3lock \
            -i "$WALLPAPER" \
	    --fill \
            --clock \
            --indicator \
            --time-str="%H:%M:%S" \
            --date-str="%A, %b %d" \
            --ring-color="b4befeff" \
            --inside-color="00000000" \
            --keyhl-color="7aa2f7ff" \
            --separator-color="00000000" \
            --radius 100 \
            --ring-width 15
	    
        ;;
esac
