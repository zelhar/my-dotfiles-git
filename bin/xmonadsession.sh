#loading ~/.Xresources
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#Launch xmonad
#set up icon tray
exec trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 23 &

# Set the background color<
#xsetroot -solid midnightblue

# Fire up apps
exec xscreensaver -no-splash &

# My autostarts
unclutter -b
touchpad_config -e
blueman-applet &
#blueberry-tray &
#exec flameshot  &
#exec blueman-applet &
#exec megasync &
exec udiskie -at &
#exec /home/zelhar/Downloads/Telegram/Telegram &
#exec xfce4-clipman &
exec xmonad

