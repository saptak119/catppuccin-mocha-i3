#!/bin/bash
#
#chosen=$(nmcli -t -f IN-USE,SSID,SECURITY device wifi list | \
#    sed 's/^\*:/ /;s/^:/  /' | \
#    rofi -dmenu -i -p "WiFi")
#
#if [ -z "$chosen" ]; then
#   exit
#fi
#
#ssid=$(echo "$chosen" | awk '{print $1}')
#
#nmcli device wifi connect "$ssid"
#
#!/bin/bash
rofi -show drun
