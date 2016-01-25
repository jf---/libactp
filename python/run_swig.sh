#!/usr/bin/env bash

export OutDir="."
export InputPath=`pwd`
export PYTHON_INCLUDE="/Users/jelleferinga/miniconda/include/python2.7/Python.h"

#swig -c++ -includeall -python -outdir "$OutDir" -I../src -I../src/bolts -I"$PYTHON_INCLUDE"
swig -c++ -python -outdir "$OutDir" -I../src FreesteelPython.i



