#!/usr/bin/env python


import subprocess
import sys
import os
def err_msg():

         print "Please specify valid directory"
         quit()

if __name__=="__main__":
    if len(sys.argv)<>2:
        print sys.argv
        err_msg()
    else:
        i_dir = sys.argv[1]
        raw_input("sort %s ?"%i_dir)
        chk = os.path.isdir(i_dir)
        if chk==False:
            err_msg()
        else:
            os.chdir(i_dir)
            os.mkdir("data")
            os.mkdir("plots")
            os.mkdir("screenshots")
            os.system("mv *.txt data/")
            os.system("mv *.pdf plots/")
            os.system("mv *info data/")
            os.system("cp ../Readme .")
            os.chdir("..")
            tarstr="tar -cvf TAR/"+i_dir+".tar "+i_dir+"/"
            os.system(tarstr)

