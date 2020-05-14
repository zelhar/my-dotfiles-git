#!/bin/bash
#rsync -rvthP \
rsync -rvthP --delete \
    siksak@siksak-asusingo://'/home/siksak/awaywork' \
    '/home/zelhar/'

