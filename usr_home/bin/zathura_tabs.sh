#!/bin/bash
#tabbed -cd zathura -e
#$(tabbed -d >/tmp/tabbed.xid); urxvt -embed $(</tmp/tabbed.xid);
#$(tabbed -d >/tmp/tabbed.xid); zathura -embed $(</tmp/tabbed.xid);
file_path="/tmp/ztabbed.xid"

#by convention I will only execute 'tabbed -fd' for this purpose
#could use tabbed -df for different non-zathura applications
#if ! pgrep -f "tabbed -fd zathura" > /dev/null ; #if tabbed is not running, delete tabbed.xid
if ! pgrep -f "tabbed -fd zathura"; then #if tabbed is not running, delete tabbed.xid
    echo "process doesn't exist yet"
    if [[ -e $file_path ]] ; then
        rm $file_path
        echo "removed old path"
    fi
    #tabbed -fd zathura --fork -e > $file_path
    #echo "spawned new zathura tabbed"
fi

if [[ -e $file_path ]] ; then
#    zathura -e $(</tmp/tabbed.xid) --fork "$@"
    zathura --fork "$@" -e $(< $file_path) 
    echo "sent new zathura instance to open tabbed"
else
    #will open one emprty zathura tab as a side effect
    tabbed -fd zathura --fork -e > $file_path
    sleep 1
    zathura --fork "$@" -e $(< $file_path)
#    $(tabbed -d >/tmp/tabbed.xid); zathura -e $(</tmp/tabbed.xid) --fork "$@"
#tabbed -d >/tmp/tabbed.xid zathura -e $(</tmp/tabbed.xid) "$@"
#tabbed -d >/tmp/tabbed.xid zathura -e $(< $file_path) "$@"
fi

#ext pdf, has zathura,  X, flag f = zathura -- "$@"
