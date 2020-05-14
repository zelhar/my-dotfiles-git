#!/bin/bash
#set up the xkeyboard
setxkbmap -I $HOME/.xkb/symbols \
    -model pc105 -layout us,de,il \
    -variant altgr-intl, \
    -option grp:alt_space_toggle, \
    -option terminate:ctrl_alt_bksp, \
    -option compose:rctrl-altgr, \
    -option ctrl:nocaps, \
#    -option xkbtest:lgst-intl,
#    -variant lgst-intl, \
#    -variant altgr-intl, \

# commandline for xkbcomp that worked with my personal 'lgst-intl'
#xkbcomp -I$HOME/.xkb ~/bin/xkbconf $DISPLAY

# (install xcape) make short Ctrl behave like Esc:
xcape -e 'Control_L=Escape'

#echo "set xkeyboard"
#echo $(date) + "set xkeyboard" >> ~/temp/templog
