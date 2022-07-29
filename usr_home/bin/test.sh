#!/bin/bash

# Check whether the external monitor is connected
xrandr | grep "HDMI-A-0" | grep "dissconnected" > /dev/null

# 0 returned if successful
if [ $? -eq 1 ]; then
#    #xrandr --output HDMI-A-0 --primary
    echo "yes hdmi connected"
fi

if [[ -e /tmp/ztabbed.xid ]]; then
    echo "yes"
elif pgrep "tabbed"; then
    echo "tabbed"
fi
#else;
#    echo "no"
if pgrep qute | grep 65 ; then
    echo "qute"
fi

file_path="/tmp/ztabbed.xid"
if [[ -e $file_path ]] ; then
    xid=$(cat $file_path)
    echo "xid = $xid"
    #if pgrep qute | grep 65 ; then
fi
