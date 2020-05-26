#!/data/data/com.termux/files/usr/bin/bash
zip -v termux_bak.zip * *.* *
zip -v termux_bak.zip .vim/* .config/nvim/*
zip -v termux_bak.zip .emacs.d/*
zip -v -r termux_bak.zip .vim -x \*plugg\* \*bundle\* 
zip -v -r  termux_bak.zip .config/nvim -x \*plugg\* \*bundle\*
zip -v -r termux_bak.zip .ssh .termux .termux.bak temp bin
