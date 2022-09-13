#!/usr/bin/env bash

PACMAN_ARGS=(--noconfirm --noprogressbar --needed --disable-download-timeout)

pacman -S "${PACMAN_ARGS[@]}" i3-gaps
pacman -S "${PACMAN_ARGS[@]}" polybar
pacman -S "${PACMAN_ARGS[@]}" xautolock xsecurelock
pacman -S "${PACMAN_ARGS[@]}" rofi
pacman -S "${PACMAN_ARGS[@]}" dunst
pacman -S "${PACMAN_ARGS[@]}" nerd-fonts-cascadia-code wqy-microhei
