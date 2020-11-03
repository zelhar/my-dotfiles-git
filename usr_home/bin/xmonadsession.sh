#loading ~/.Xresources
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

# set external screen as primary:
#xrandr --output HDMI-A-0 --primary
# Check whether the external monitor is connected
xrandr | grep "HDMI-A-0" | grep "connected" > /dev/null
# 0 returned if successful
#if [ $? -eq 0 ]; then
#    xrandr --output HDMI-A-0 --primary
#    bash ~/bin/deactivate_notebookscreen.sh
#    #echo "yes"
#fi

#start notifications daemon
exec dunst &
exec lxqt-policykit-agent &

# Fire up apps
exec xscreensaver -no-splash &
exec caffeine &

# My autostarts
unclutter -b &
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
exec xmonad

