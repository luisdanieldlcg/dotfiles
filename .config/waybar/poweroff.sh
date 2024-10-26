#!/usr/bin/env bash

# Dependencies: bemenu 

bg='#181718e6'
fg="" # default color
fg_active='#ffffff'

options="󰜺 Cancel\n󰑓 Reboot\n󰐥 Shutdown"
selected=$(echo -e $options \
	| bemenu \
	-i \
	--prefix '' \
	--prompt 'Power  ' \
	--list 7 \
	--fn 'Noto Sans' \
	--fb "$bg" \
	--ff "$fg" \
	--nb "$bg" \
	--nf "$fg" \
	--tb "$bg" \
	--hb "$bg" \
	--tf "$fg_active" \
	--hf "$fg_active" \
	--nf "$fg" \
	--af "$fg" \
	--ab "$bg")

if [[ "$selected" == *"Cancel"* ]]; then
	:
elif [[ "$selected" == *"Shutdown"* ]]; then
	systemctl poweroff
elif [[ "$selected" == *"Reboot"* ]]; then
	systemctl reboot
fi

