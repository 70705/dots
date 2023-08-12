#!/bin/bash

# run once function
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

processes=("picom" "polybar" "eww" "sxhkd" "dunst")

for process in "${processes[@]}"; do
  if pidof -q "$process"; then
    pkill -9 -x "$process" > /dev/null; sleep 0.1
  fi
done

$HOME/.config/bspwm/scripts/SetSysVars

# launch sxhkd
sxhkd -c $HOME/.config/bspwm/sxhkdrc &

# launch polybar
polybar bar -c $HOME/.config/bspwm/polybar/config.ini &

# set default cursor shape
xsetroot -cursor_name left_ptr &

# set wallpaper
# feh --no-fehbg --bg-fill ~/.wallpaper/wallpaper.jpg &

# launch picom
picom --config $HOME/.config/bspwm/picom.conf &

# launch polkit gnome
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# launch dunst
dunst -config "$HOME"/.config/bspwm/dunstrc &

