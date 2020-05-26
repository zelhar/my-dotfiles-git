#!/bin/bash
rsync -tPvr --delete-excluded --delete --ignore-errors \
    --files-from='./dotfileslist.txt' \
    --exclude '.git/*' \
    --exclude '.cache/' \
    --exclude '.netrwhist' \
    /home/zelhar ./usr_home/

#backup installed packages list
pacman -Qe > package_list.txt
conda list -n test > conda_test_env_package_list.txt
