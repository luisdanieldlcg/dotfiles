#!/usr/bin/env bash

# Dependencies: bemenu 
# Theme: Gruvbox 

options="󰜺 Cancel\n󰗽 Logout\n󰑓 Reboot\n󰐥 Shutdown"
selected=$(echo -e $options \
	| bemenu \
	-i \
	--prefix '' \
	--prompt 'Power  ' \
	--list 7 \
	--fn 'Iosevka' \
	--fb "#282828" \
	--ff "#ebdbb2" \
	--nb "#282828" \
	--nf "#ebdbb2" \
	--tb "#282828" \
	--hb "#282828" \
	--tf "#fb4934" \
	--hf "#fabd2f" \
	--nf "#ebdbb2" \
	--af "#ebdbb2" \
	--ab "#282828")

if [[ "$selected" == *"Cancel"* ]]; then
	:
elif [[ "$selected" == *"Logout"* ]]; then
	hyprctl dispatch exit
elif [[ "$selected" == *"Shutdown"* ]]; then
	systemctl poweroff
elif [[ "$selected" == *"Reboot"* ]]; then
	systemctl reboot
fi

