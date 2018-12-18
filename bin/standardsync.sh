#!/bin/bash
#rsync -r -t -v --delete --progress /home/zelhar /run/media/
#rsync -r -t -P -v --exclude '**.cache/**' --delete-excluded /home/zelhar /run/media/zelhar/Seagate\ Backup\ Plus\ Drive/Yiftach/Backups/archMinipc/
rsync -r -t -P -v --delete-excluded --ignore-errors --exclude '**.cache/**' --exclude '.cabal*' \
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
    /home/zelhar /run/media/zelhar/Yiftach_4TB_BKP/Yiftach/Backups/archMinipc/
#    --delete-excluded /home/zelhar /run/media/zelhar/Yiftach_4TB_BKP/Yiftach/Backups/archMinipc/
#Yiftach_4TB_BKP
echo "next task"
rsync -r -t -P -v --delete-before --ignore-errors \
    /home/zelhar/Downloads /run/media/zelhar/Yiftach_4TB_BKP/Yiftach/Backups/archMinipc/zelhar/
