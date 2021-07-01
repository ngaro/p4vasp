#!/usr/bin/env python2

import os
import os.path
import sys
from string import *

def run(cmd):
    os.system("%s >fltk-config.tmp"%cmd)
    return open("fltk-config.tmp").read()

print run("fltk-config "+" ".join(sys.argv[1:]))
