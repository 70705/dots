#!/bin/bash

# run once function
function run {
	if ! pgrep $1; then
		$@ &
	fi
}

processes=("picom")

for process in "${processes[@]}"; do
	if pidof -q "$process"; then
		pkill -9 -x "$process" >/dev/null
		sleep 0.1
	fi
done

# set wallpaper
# feh --no-fehbg --bg-fill ~/.wallpaper/wallpaper.jpg &

# launch picom
picom --config ~/.config/awesome/picom.conf &

# launch polkit gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
