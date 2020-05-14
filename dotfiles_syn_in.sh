#!/bin/bash
rsync -tPvr --delete-excluded --delete --ignore-errors \
    --files-from='./dotfileslist.txt' \
    --exclude '.git/*' \
    --exclude '.cache/' \
    /home/zelhar ./usr_home/
