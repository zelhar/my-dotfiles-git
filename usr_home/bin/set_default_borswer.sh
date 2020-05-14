#!/usr/bin/bash
# set the xdg default web browser
# some applications use the BROWSER env rather than the xdg
# some use other methods...

#my_browser=org.qutebrowser.qutebrowser.desktop
my_browser=brave-browser.desktop

xdg-mime default $my_browser x-scheme-handler/http
xdg-mime default $my_browser x-scheme-handler/https
xdg-mime default $my_browser text/html
xdg-settings set default-web-browser $my_browser

