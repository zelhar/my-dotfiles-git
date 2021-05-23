#!/bin/bash
rsync -r -t -P -v --delete-excluded --ignore-errors \
    --exclude '**.cache/**' \
    --exclude '.cache/*' \
    --exclude '**/.stack-work/*' \
    --exclude '**/plugged/*' \
    --exclude '*.local/share/*' \
    --exclude '*/.cache/*' \
    --exclude '.*ib-tws/*' \
    --exclude '.arduino*/' \
    --exclude '.atom/' \
    --exclude '.cabal*' \
    --exclude '.config/Brave*/*' \
    --exclude '.config/google-chrome*' \
    --exclude '.config/opera*' \
    --exclude '.config/vivaldi*' \
    --exclude '.electron/*' \
    --exclude '.gem/*' \
    --exclude '.local/bin/*' \
    --exclude '.luarocks*' \
    --exclude '.mozilla*' \
    --exclude '.npm/' \
    --exclude '.tmux/plugins/' \
    --exclude '.sane/*' \
    --exclude '.stack/*' \
    --exclude '.steam/*' \
    --exclude '.surf/*' \
    --exclude '.vnc/*' \
    --exclude '.vscode-oss/*' \
    --exclude '.wine*/' \
    --exclude 'R/*' \
    --exclude 'miniconda3/*' \
    --exclude 'my_aur_gits/*' \
    --exclude 'share/Steam/*' \
    --exclude '*.paradox*' \
    --exclude '**/temp/*' \
    --exclude '.config/Brave*/*' \
    --exclude '.config/Slack/*' \
    --exclude '.oh-my-zsh/' \
    --exclude '*/.node*/' \
    --exclude '*/.ghcup*/**' \
    --exclude '**/whats-app' \
    --exclude '*/VitrualBox VMs' \
    --exclude '.config/Code -*' \
    --exclude '**/node_modules/*' \
    --exclude '**/.snakemake/*' \
    --exclude '**/.julia/*' \
    --exclude '**/conda/*' \
    --exclude '**/.git/*' \
    --exclude '**/.vpython-root/*' \
    --exclude '$HOME/Jts/*' \
    --exclude '$HOME/.zoom/*' \
    /home/zelhar \
    /run/media/zelhar/Yiftach_4TB_BKP/Yiftach/Backups/yjk-thinkpad-archarch/
#    --exclude '~/.*/*' \
#    --include '~/.vim/*' \
