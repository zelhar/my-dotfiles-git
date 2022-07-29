#!/bin/bash
# see man xkeyboard-config
#set up the xkeyboard
setxkbmap -I $HOME/.xkb/symbols \
    -model pc105 -layout us,de,il \
    -variant altgr-intl, \
#    -option , \

#echo "foo"

setxkbmap -option grp:alt_space_toggle, \
    -option terminate:ctrl_alt_bksp, \
    -option compose:rctrl-altgr, \
    -option shift:both_capslock_cancel, \
    -option ctrl:nocaps, \
#    -option caps:escape_shifted_capslock, \
#    -option xkbtest:lgst-intl,
#    -variant lgst-intl, \
#    -variant altgr-intl, \

#echo "foo2"

# commandline for xkbcomp that worked with my personal 'lgst-intl'
#xkbcomp -I$HOME/.xkb ~/bin/xkbconf $DISPLAY

# (install xcape) make short Ctrl behave like Esc:
xcape -e 'Control_L=Escape'

#echo "set xkeyboard"
#echo $(date) + "set xkeyboard" >> ~/temp/templog
