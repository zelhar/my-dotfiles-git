#!/usr/bin/python3.3
import vim
import sys
import os
import time
import termios
import hashlib
import pickle
import shutil

print('test\n') 
#s = input('press key to exit ') 
cb = vim.current.buffer
#The command bellow returns the full path
tempname = cb.name
#print('current buffer name is: ', tempname)

findex = tempname.rindex('/')
fname = tempname[findex+1:]
#print('file name is: ', fname)

backupdir = vim.eval("g:mybackupdir")
#print('backupdir is: ', backupdir)

full_path = backupdir + os.sep + fname
#print('full path is: ', full_path)

print('\n\n')
for i in vim.buffers:
    print('i is: ', i, '\nand its name is ',i.name)

time.sleep(5)
'''''''
"" 
alot og chars ''ff''
""
'''''''
no

""""""" 
ooo
'alalla akbar' 
"""""""
ff

