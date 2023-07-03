#!/bin/bash

# Check whether the external monitor is connected
xrandr | grep "HDMI-A-0" | grep "connected" > /dev/null

# 0 returned if successful
if [ $? -eq 0 ]; then
    xrandr --output HDMI-A-0 --primary
    #echo "yes"
fi
#xrandr --output HDMI-A-0 --primary

killall -q trayer
while pgrep -u $UID -x trayer >/dev/null; do sleep 1; done

# backup
#exec trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --tint 0x696969 --height 20 \
# --monitor primary --alpha 60 -l &

exec trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent false --tint 0x696969 --height 20 \
 --monitor primary --alpha 60 -l &

#exec trayer --edge top --align right --SetDockType true --SetPartialStrut true \
# --expand true --width 10 --transparent true --tint 0x191970 --height 23 \
# --monitor primary &
