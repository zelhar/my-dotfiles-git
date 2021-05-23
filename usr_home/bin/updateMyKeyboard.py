import sys
import time
import subprocess
import os


# sys.stdout.write(x)


n = 0
while True:
    #sys.stdout.write("doing some important work\n")
    n += 1
    #time.sleep(120)
    time.sleep(2)
    p = "$HOME/bin/myxkeyboardsetting.sh"
    p = os.path.expandvars(p)
    command = "bash " + p
    #s = subprocess.run(
    #    ["echo", "hello world"], shell=True, check=True, capture_output=True
    #)
    #s = subprocess.run(["bash", p], shell=True, check=True, capture_output=True)
    #print(s)
    pr = os.popen(p)
    print(pr.read())
    #pr.read()
    pr.close()
    pr = os.popen("ls -a")
    #print(pr.read())
    pr.close()

    #os.system(command=command)
    #os.system("echo 'hiiiiiii\n'")
    #print("hi")
    if n > 4:
        break
    #subprocess.run([p], stdout=subprocess.DEVNULL)
    #pr = subprocess.Popen([p], stdout=subprocess.PIPE)
    #time.sleep(1)
    #pr.communicate()
    #time.sleep(1)
    #pr.kill()

