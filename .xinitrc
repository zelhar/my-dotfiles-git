# To start a gui session from terminal type (for kde as example):
# set the default xeboard
#setxkbmap -model pc105 -layout us,de,il -variant altgr-intl,T3, -option grp:alt_space_toggle -option terminate:ctrl_alt_bksp -option compose:rctrl-altgr 
setxkbmap -model pc105 -layout us,de,il -variant altgr-intl, -option grp:alt_space_toggle -option terminate:ctrl_alt_bksp -option compose:rctrl-altgr 
# load ~/.Xresources
xrdb -merge .Xresources

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f ~/.xprofile ] && source ~/.xprofile

# $ startx ~/.xinitrc kde
# Here Xfce is kept as default
#session=${1:-xfce}
session=${1:-xmonad}

case $session in
#    awesome           ) exec awesome;;
#    budgie            ) export XDG_CURRENT_DESKTOP="Budgie:GNOME"; exec budgie-desktop;;
#    #budgie            ) exec XDG_CURRENT_DESKTOP="Budgie:GNOME"  budgie-desktop;;
#    bspwm             ) exec bspwm;;
#    catwm             ) exec catwm;;
#    cinnamon          ) exec cinnamon-session;;
#    dwm               ) exec dwm;;
#    enl|enlightenment     ) exec enlightenment_start;;
#    ede               ) exec startede;;
#    fluxbox           ) exec startfluxbox;;
#    gnome             ) exec gnome-session;;
#    gnome-classic     ) exec gnome-session --session=gnome-classic;;
#    i3|i3wm           ) exec i3;;
#    icewm             ) exec icewm-session;;
#    jwm               ) exec jwm;;
    kde               ) exec startkde;;
#    mate              ) exec mate-session;;
#    monster|monsterwm ) exec monsterwm;;
#    notion            ) exec notion;;
    openbox           ) exec openbox-session;;
#    kobox             ) exec openbox-kde-session;;
#    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4;;
#    xmonad            ) exec /usr/bin/xmonad;;
    xmonad            ) exec ~/bin/xmonadsession.sh;;
#    ymonad            ) exec .myxmonadsession; exec /usr/bin/xmonad;;
#    #xmonad            ) exec dbus-launch /usr/bin/xmonad;;
#    lxde              ) exec startlxde;;
#    lxqt              ) exec startlxqt;;
#    # No known session, try to run it as command
    *) exec dbus-launch $1;;
esac

