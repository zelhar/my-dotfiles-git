#!/usr/bin/bash
#loading ~/.Xresources
#PATH="/usr/bin:$PATH"
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#Launch xmonad
#set up icon tray
#pkill trayer
#killall -q trayer
#while pgrep -u $UID -x trayer >/dev/null; do sleep 1; done
#
#exec trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --tint 0x191970 --height 23 &

# Set the background color<
#xsetroot -solid midnightblue
#xsetroot -solid black

# set external screen as primary:
#xrandr --output HDMI-A-0 --primary
# Check whether the external monitor is connected
xrandr | grep "HDMI-A-0" | grep "disconnected" > /dev/null
# 0 returned if successful
if [ $? -eq 1 ]; then
    xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output eDP --off --output HDMI-A-0 --primary --pos 0x0 --rotate normal
#    xrandr --output HDMI-A-0 --primary
#    bash ~/bin/deactivate_notebookscreen.sh
#    #echo "yes"
fi

#start notifications daemon
exec dunst &
exec lxqt-policykit-agent &

# Fire up apps
exec xscreensaver -no-splash &
#exec caffeine &

xset dpms 3600 3600 3600
xset s 3000 3000

# My autostarts
#unclutter -b &
#exec unclutter -idle 2 &
#exec xbanish -t 5 &
#unclutter -idle 2 &
touchpad_config -e &
#blueman-applet &
#blueberry-tray &
exec flameshot  &
#exec blueman-applet &
#exec megasync &
exec udiskie -at &
#exec /home/zelhar/Downloads/Telegram/Telegram &
exec xfce4-clipman &
exec pasystray &
# Set background image with feh
#feh --bg-scale $HOME/Downloads/Wonder_Lake_and_Denali.jpg &
#exec xmobar &
#exec watch -n 120 myxkeyboardsetting.sh &
#exec python ~/bin/updateMyKeyboard.py &
#exec ~/bin/deactivate_notebookscreen.sh
exec xmonad

