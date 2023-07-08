#!/bin/bash
rsync -tlPvr --delete-excluded --delete --ignore-errors \
    --munge-links \
    --files-from='./dotfileslist.txt' \
    --exclude '.git/*' \
    --exclude '.cache/' \
    --exclude '.netrwhist' \
    /home/zelhar ./usr_home/

#backup installed packages list
pacman -Qe > ./package_list.txt
micromamba list -n mdc > mdc_micromamba_env.txt
mamba list -n torch > torch_mamba_env.txt
#conda list -n test > ./conda_test_env_package_list.txt
