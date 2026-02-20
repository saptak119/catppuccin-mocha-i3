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
        i3lock -c 000000
        ;;
esac
