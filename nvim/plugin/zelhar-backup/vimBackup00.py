#!/usr/bin/python3.3
import vim
import sys
import os
import time
import termios
import hashlib
import pickle
import shutil


def validate_bkp_dir(path):
    """Checks that the path is a directory with write permission. Returns True
    or Fals accordingly"""
    return os.access(str(path), os.W_OK) & os.path.isdir(str(path))

def validate_source_file(path):
    """Boolean Function. Checks that the path is valid 
    and has read permission."""
    return os.access(str(path), os.R_OK) & os.path.isfile(str(path))

def add_slash(path):
    """Makes sure directory path ends with os.sep. Returns the normalized
    form"""
    if (path[-1] != os.sep):
        return path + os.sep
    else:
        return path

def get_source_file_path_interactive():
    """Gets from the user the backup directory and the source files."""
    #print('Enter the full path for the backup directory: ')
    while True:
        path = input('\nEnter the full path for the backup directory: ')
        check = validate_bkp_dir(path)
        if check:
            return path  
        else:
            print('Something is wrong. Please enter path again or ctrl-c to end\
                    program')

class FileSaver:
    """Initiates with validated source file and backup dir. Checks and saves a
    backup if file has changed"""
    def __init__(self, source_file_path, bkp_dir_path, save_time = None):
        self.source = source_file_path
        self.bkpdir = add_slash(bkp_dir_path)
        self.save_time = save_time
    def backup(self):
        change_time = os.path.getmtime(self.source)
        if (change_time != self.save_time):
            source_file_name = os.path.basename(self.source)
            time_string = time.strftime('%Y-%m-%d %Hh%Mm%ss')
            target_name = source_file_name + '.' + time_string + '.bkp'
            target_path = self.bkpdir + target_name
            #source_file = open(self.source, 'rb')
            #target_file = open(target_path, 'wb')
            #target_file.write(source_file.read())
            shutil.copy2(self.source, target_path)
            self.save_time = change_time
            #source_file.close()
            #target_file.close()
            return True
        else:
            return False
    def save(self):
        """saves over the same backup file name instead of creating a new
        copy"""
        source_file_name = os.path.basename(self.source)
        target_name = source_file_name + '.bkp'
        target_path = self.bkpdir + target_name
        return shutil.copy2(self.source, target_path)

def test_run():
    files = ['kululul', '/home/zelhar/.vimrc']
    bkpdirs = ['/kisdl', '/home/zelhar/tmp']
    for f in files:
        print(f, ' is ', validate_source_file(f))
    for b in bkpdirs:
        print(b, ' is ', validate_bkp_dir(b))
    print('{} in normalized form is {}'.format(bkpdirs[1], add_slash(bkpdirs[1]))) 
    print('now testing the class FileSaver')
    f = FileSaver('/home/zelhar/tmp/AAA_Test_File.txt', '/home/zelhar/tmp', None)
    print('source file is: ', f.source)
    print('backup dir is: ', f.bkpdir)
    print('save time is: ', f.save_time)
    f.backup()

def simple_run(list_of_files=[], default_bkp_dir=os.path.abspath('.')):
    """Gets as input a list and optional a default backup directory. Each
    list entry is either a string that describes the location of a file or a
    tuple of two strings- one for the file and the other a path to the
    directory where backup will be performed for that file."""
    bkp_dir = os.path.abspath(default_bkp_dir)
    files = list_of_files
    if not recursive_mkdir(bkp_dir):
        print('Invalid backup directory path or write permission')
        return None
    i = 0
    while i < len(files):
        if type(files[i]) == str:
            if validate_source_file(files[i]):
                files[i] = (list_of_files[i], bkp_dir)
                i = i + 1
                continue
            else:
                s = files.pop(i)
                print('something is wrong with the path of', s)
                continue
        elif type(files[i]) == tuple:
            if (validate_source_file(files[i][0]) 
            and validate_bkp_dir(files[i][1])):
                i = i + 1
                continue
            else:
                s = files.pop(i)
                print('something is wrong with the path of', s)
                continue
        else:
            s = files.pop(i)
            print(s, ' is invalid path')
            continue
    if files == []:
        print('nothing is left to do')
        return None
    else: #replace tuples with matching FileSaver Object
        for i in range(len(files)):
            x = FileSaver(files[i][0], files[i][1])
            files[i] = x
    try:
        while True:
            for f in files:
                f.backup()
            time.sleep(5) #sleep a couple of seconds
    except KeyboardInterrupt:
        print('\nI am done!\n')

def recursive_mkdir(path):
    """Tries to create directory recursively. It seems to work. But there is
    already a built in function: 'os.makedirs('path')'"""
    abspath = os.path.abspath(path)
    if os.path.isdir(path):
        return os.access(str(path), os.W_OK)
    elif recursive_mkdir(os.path.dirname(abspath)):
        os.mkdir(abspath)
        return True
    else:
        return False


def check_make_dir(path):
    """Checks that given path is valid directory and has wite permission.
    Creates the directory if it doesn't exist"""
    dir_path = os.path.abspath(path)
    check = validate_bkp_dir(abs_path)
    return None


#if (__name__ == '__main__'):
#    print("my name is", __name__)
#    test_run()
#    simple_run(['/home/zelhar/.vimrc', '/home/zelhar/.gvimrc'], 
#            '/run/media/zelhar/Transcend64/backup_files')
#    #simple_run(['/home/zelhar/.vimrc', '/home/zelhar/.gvimrc'], 
#    #        './test')

#Get the current buffer (The File to backup)
cb = vim.current.buffer
#The command bellow returns the full path
tempname = cb.name
# now find where the actual file name starts:
findex = tempname.rindex('/')
fname = tempname[findex+1:]

backupdir = vim.eval("g:mybackupdir")
full_path = backupdir + os.sep + fname
target = FileSaver(vim.current.buffer.name, backupdir)
#target.backup()
target.save()
