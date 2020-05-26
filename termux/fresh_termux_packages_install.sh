#!/data/data/com.termux/files/usr/bin/bash
#start a fresh termux going!
echo "updating. . ."
pkg update
echo "now upgrading"
pkg upgrade
echo "adding essential pkg"
pkg install grep ack-grep zip unzip coreutils diffutils findutils
echo "and more..."
pkg install curl git htop mc mlocate neovim openssh p7zip python
echo "and more"
pkg install rsync tmux vim-python wget
echo "and more"
pkg install zsh termux-api gpgv tty-clock wol inetutils
echo "and more"
pkg install silversearcher-ag fzf ncurses-utils ranger
