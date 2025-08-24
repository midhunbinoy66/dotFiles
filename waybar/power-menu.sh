#!/bin/bash

chosen=$(echo -e " Lock\n⏻ Shutdown\n Reboot\n⏾ Suspend\n󰍃 Logout" | rofi -dmenu -i -p "Power Menu")

case $chosen in
    " Lock")      hyprctl dispatch lock ;;   # Replace with your lock command
    "⏻ Shutdown")  systemctl poweroff ;;
    " Reboot")    systemctl reboot ;;
    "⏾ Suspend")   systemctl suspend ;;
    "󰍃 Logout")    hyprctl dispatch exit ;;   # For Hyprland. Use `swaymsg exit` for Sway.
esac