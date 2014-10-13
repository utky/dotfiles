#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import fnmatch
import os
import os.path as path
import functools

EXCLUDE_FILES = (".git", "*.markdown", path.basename(__file__))

def isexcluded(f):
    for e in EXCLUDE_FILES:
        if fnmatch.fnmatch(f, e):
            return True
    return False

def main(args):
    if 1 < len(args):
        targetdir = args[1]
    else:
        targetdir = path.expanduser("~")

    scriptpath = __file__
    basedir = path.dirname(scriptpath)
    sourcefiles = [path.abspath(s) for s in os.listdir(basedir) if not isexcluded(s) and path.isfile(s)]

    filenames = [path.basename(s) for s in sourcefiles]
    dotted = ["." + f for f in filenames]
    targetfiles = [path.join(targetdir, f) for f in dotted]

    for (s, t) in zip(sourcefiles, targetfiles):
        os.symlink(s, t)
        print(t)

    return targetfiles

if __name__ == "__main__":
    main(sys.argv)
