#!/usr/bin/env python
import subprocess
import time
import shutil
import sys
import os
import signal


def spawn_roscore():
    d = subprocess.Popen(args=[ "gnome-terminal", "--command=roscore"]).pid
    return d
def run_bag(bag):
    d = subprocess.Popen(args=["gnome-terminal","--command=rosbag play %s"%bag]).pid
    return d
def pub_sim_map(no):
    d= subprocess.Popen(args=["gnome-terminal","--command=/home/goa-tz/git/care-o-bot/cob_environment_perception/cob_3d_mapping_rviz_plugins/bin/map_publisher %i"%no])
    
def run_geometry_map():
    d=subprocess.Popen(args=["gnome-terminal","--command=roslaunch cob_3d_mapping_geometry_map geometry_map.launch"])
    return d

if __name__=="__main__":
    i=1
    os.chdir("/home/goa-tz/eval/timing")
    while i <=501:
        p =run_geometry_map()
        time.sleep(6)
        pub_sim_map(i)
        time.sleep(5)
        os.system("rm *")
        run_bag("/share/goa-tz/evaluation_geometry_map/bags/005/005_class.bag")
        time.sleep(80)
        os.mkdir("%i_3"%i)
        os.system("mv * %i_3"%i)
        os.system("mv %i_3 .."%i)
        os.kill(p.pid,signal.SIGTERM)
        i+=50
