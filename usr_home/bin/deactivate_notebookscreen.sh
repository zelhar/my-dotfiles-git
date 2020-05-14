#!/bin/bash
#xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
#xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output eDP --off --output HDMI-A-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal
#xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output eDP --off --output HDMI-A-0 --primary --pos 0x0 --rotate normal
xrandr --output eDP --primary --pos 0x0
sleep 3
xrandr --output eDP --off
sleep 3
xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output eDP --off --output HDMI-A-0 --primary --pos 0x0 --rotate normal

feh --bg-fill ~/Downloads/Wonder_Lake_and_Denali.jpg
