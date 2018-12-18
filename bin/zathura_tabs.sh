#!/bin/bash
#tabbed -cd zathura -e
#$(tabbed -d >/tmp/tabbed.xid); urxvt -embed $(</tmp/tabbed.xid);
#$(tabbed -d >/tmp/tabbed.xid); zathura -embed $(</tmp/tabbed.xid);
file_path="/tmp/tabbed.xid"
if ! pgrep -x "tabbed" > /dev/null #if tabbed is not running, run it
then
    $(tabbed -d >/tmp/tabbed.xid);
fi
if [[ -e $file_path ]] ; then
    zathura -e $(</tmp/tabbed.xid) --fork "$@"
else
    $(tabbed -d >/tmp/tabbed.xid); zathura -e $(</tmp/tabbed.xid) --fork "$@"
fi
#ext pdf, has zathura,  X, flag f = zathura -- "$@"
