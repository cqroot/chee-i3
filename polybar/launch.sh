#!/usr/bin/env bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
args=(-c "${script_dir}/config.ini" --reload)

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$(xrandr | grep -c "connected")" -gt 1 ]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        if [ "$m" == "HDMI-1" ]; then
            MAINMON=$m POLYBAR_DIR=${script_dir} polybar "${args[@]}" main &
        else
            NOTRAYMON=$m POLYBAR_DIR=${script_dir} polybar "${args[@]}" notray &
        fi
    done
else
    POLYBAR_DIR=${script_dir} polybar "${args[@]}" main 2>&1 | tee -a /tmp/polybar.log &
fi
disown
