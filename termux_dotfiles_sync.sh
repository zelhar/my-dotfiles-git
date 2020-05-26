#!/bin/bash
rsync -tPvr --delete-excluded --delete --ignore-errors \
    --files-from='./termux_files.txt' \
    --exclude '.git/*' \
    --exclude '.cache/' \
    --exclude '.netrwhist' \
    $HOME ./termux/
