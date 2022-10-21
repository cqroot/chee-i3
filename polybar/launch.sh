#!/usr/bin/env bash

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
args=(-c "${script_dir}/config.ini" --reload)

pgrep polybar | xargs kill -9

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if [ "$(xrandr | grep -c "connected")" -gt 1 ]; then
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        if [ "$m" == "HDMI-1" ]; then
            MAINMON=$m POLYBAR_DIR=${script_dir} polybar "${args[@]}" main 2>&1 &
        else
            NOTRAYMON=$m POLYBAR_DIR=${script_dir} polybar "${args[@]}" notray 2>&1 &
        fi
    done
else
    POLYBAR_DIR=${script_dir} polybar "${args[@]}" main 2>&1 | tee -a /tmp/polybar.log 2>&1 &
fi

disown
