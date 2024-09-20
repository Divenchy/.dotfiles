#!/bin/bash

function powermenu {
	options="Cancel\nShutdown\nRestart\nSleep"
	selected=$(echo -e $options | dmenu -i -p "Choose system procedure:")
	if [[ $selected = "Shutdown" ]]; then
		systemctl poweroff -P now
	elif [[ $selected = "Restart" ]]; then
		systemctl reboot
	elif [[ $selected = "Sleep" ]]; then
		systemctl suspend
	elif [[ $selected = "Cancel" ]]; then
		return
	fi
}

powermenu
	
