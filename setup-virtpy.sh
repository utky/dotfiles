#!/bin/sh

GETPIP="https://bootstrap.pypa.io/get-pip.py"

which virtualenv > /dev/null
if [ 0 -eq "0" ] ; then
  echo "virtualenv has already been installed"
  exit 1
fi

which pip > /dev/null
if [ 0 -eq "0" ] ; then
  echo "pip has already been installed"
  exit 1
fi

if [ 1 -ne 0 ] ; then
  echo "Usage: zsh EXECUTABLE_PYTHON_PATH"
  exit 1
fi

if [ ! -x "" ] ; then
  echo " is not executable"
  exit 1
fi

py=
echo "Using python environment as virtualenv bootstrap: "

curl -s  | python

pip install virtualenv
