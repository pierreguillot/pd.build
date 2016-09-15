#!/usr/bin/env python

import os
import subprocess
import sys
import argparse
import platform

#==============================================================================
# Name : parse_args
#==============================================================================

def parse_args ():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('-c', '--configuration', default = 'Release', choices = ['Debug', 'Release'])
    if platform.system() == "Darwin":
        arg_parser.add_argument('-b','--bits', default = 'x86_64', choices = ['x86_64'])
    else: # Windows and Linux
        arg_parser.add_argument('-b','--bits', default = 'x64', choices = ['x64', 'x86'])
    return arg_parser.parse_args(sys.argv[1:])

#==============================================================================

def install_linux(args):
    if platform.machine() == "x64" and args.bits == "x86":
        subprocess.check_call("sudo apt-get install -y gcc-multilib", shell = True)
        subprocess.check_call("sudo apt-get install -y libc6-dev-i386", shell = True)
    subprocess.check_call("curl https://raw.githubusercontent.com/pure-data/deken/master/developer/deken > ./deken", shell = True)
    subprocess.check_call("chmod 755 ./deken", shell = True)
    return subprocess.check_call("./deken", shell = True)
    
#==============================================================================

def install_darwin(args):
    subprocess.check_call("curl https://raw.githubusercontent.com/pure-data/deken/master/developer/deken > ./deken", shell = True)
    subprocess.check_call("chmod 755 ./deken", shell = True)
    return subprocess.check_call("./deken", shell = True)


#==============================================================================

def install_windows(args):
    subprocess.check_call("curl https://raw.githubusercontent.com/pure-data/deken/master/developer/deken > ./deken", shell = True)
    subprocess.check_call("chmod 755 ./deken", shell = True)
    subprocess.check_call("./deken", shell = True)
    return

#==============================================================================

if platform.system() == "Linux":
	install_linux(parse_args());
elif platform.system() == "Darwin":
    install_darwin(parse_args())
elif platform.system() == "Windows":
	install_windows(parse_args());
