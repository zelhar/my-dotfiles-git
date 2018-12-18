#!/bin/bash
rsync -r -t -P -v --delete-excluded --ignore-errors \
    --exclude '**.cache/**' --exclude '.cabal*' \
    --exclude '.config/google-chrome*' \
    --exclude '.config/opera*' \
    --exclude '.config/vivaldi*' \
    --exclude '.mozilla*' \
    --exclude '.atom/' \
    --exclude '.arduino*/' \
    --exclude '.npm/' \
    --exclude '.wine*/' \
    --exclude 'share/Steam/*' \
    --exclude '.steam/*' \
    --exclude '.stack/*' \
    --exclude '*/.cache/*' \
    /run/media/zelhar/Yiftach_4TB_BKP/Yiftach/Backups/archMinipc/zelhar/.vim/ \
    /home/zelhar/tempdir/
