#!/bin/bash
#tabbed -cd zathura -e
#$(tabbed -d >/tmp/tabbed.xid); urxvt -embed $(</tmp/tabbed.xid);
#$(tabbed -d >/tmp/tabbed.xid); zathura -embed $(</tmp/tabbed.xid);
file_path="/tmp/tabbed.xid"
if ! pgrep -x "tabbed" > /dev/null #if tabbed is not running, delete tabbed.xid
then
#    $(tabbed -d >/tmp/tabbed.xid);
    rm $file_path
fi

if [[ -e $file_path ]] ; then
    nohup surf -e $(< $file_path) "$@" &!
else
    tabbed -d >/tmp/tabbed.xid nohup surf -e $(< $file_path) "$@" &!
fi
#ext pdf, has zathura,  X, flag f = zathura -- "$@"
#nohup surf_tabs.sh "www.yahoo.de" &!
