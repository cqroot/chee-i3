#!/usr/bin/env bash

lock=" Lock"
logout=" Logout"
poweroff=" Poweroff"
reboot=" Reboot"

options="${lock}\n${logout}\n${poweroff}\n${reboot}"
chosen=$(echo -e "${options}" | rofi -dmenu -i -p "⏻" -theme "${I3PATH}/rofi/nord.rasi")

case ${chosen} in
"${lock}")
    sh "${I3PATH}/bin/system/lock.sh"
    ;;
"${logout}")
    loginctl terminate-user "$(whoami)"
    ;;
"${poweroff}")
    poweroff
    ;;
"${reboot}")
    reboot
    ;;
esac
