#!/bin/bash
#
# Use jupyter nbconvert to get a Python (script) version of the notebook.
# Run flake8 on the script.
#
# This script is useful to figure out CI pep8 errors. Use this and the
# flake.out file to understand the line numbers.
#
# params: $1 the notebook(s) to process

if [ -z "$1" ]; then
   echo "Usage: flake.sh <notebook(s)>"
   exit 1
fi

jupyter nbconvert $1 --stdout --to script | sed 's/^get_ipython.*$/# noqa/' > flake.out

flake8 --ignore=E703,E712,W291,W293 flake.out
