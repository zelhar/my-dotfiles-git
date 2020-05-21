#!/bin/bash
#run this as root/sudo
systemctl start libvirtd.service virtlogd.service
virsh net-start default
