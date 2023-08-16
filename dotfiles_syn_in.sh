#!/bin/bash
#rsync -tlPvr --delete-excluded --delete --ignore-errors \
rsync -tPvr --delete-excluded --delete --ignore-errors \
    --files-from='./dotfileslist.txt' \
    --exclude '.git/*' \
    --exclude '.cache/' \
    --exclude '.netrwhist' \
    /home/zelhar ./usr_home/
    #--munge-links \

#backup installed packages list
pacman -Qe > ./package_list.txt
micromamba list -n mdc > mdc_micromamba_env.txt
#mamba list -n torch > torch_mamba_env.txt
#conda list -n test > ./conda_test_env_package_list.txt

cp -p -r /etc/pacman.conf ./usr_home/etc/
cp -p -r /etc/pacman.d/mirrorlist ./usr_home/etc/
cp -p -r /etc/pacman.d/hooks/90-mkinitcpio-dkms-linux.hook ./usr_home/etc/
cp -p -r /etc/mkinitcpio.conf ./usr_home/etc/
cp -p -r /etc/mkinitcpio.d/linux.preset ./usr_home/etc/
