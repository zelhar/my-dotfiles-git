import os
import sys

mycommand = "rsync -rvth --delete --progress "
myhost = sys.argv[1]
destination = sys.argv[2]
myfilelist = sys.argv[3]

#os.system("echo " + myhost)

#s = "foo barbq baroofoo"

#s.replace("bar", "gyyc")

#print(s)

f = open(myfilelist, 'r')

s = ""

g = open('testfile.txt', 'w')

for line in f:
    comm = mycommand + myhost
    comm += "://"
    comm += line.strip()
    comm += " "
    comm += destination + "\n"
    #os.system("echo " + comm)
    g.write(comm)

f.close()
g.close()

#rsync -rvth --delete --progress  zelhar@yjk-thinkpad://'home/zelhar/FU/Stat2' ~/FU_link/
