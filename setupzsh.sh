#!/bin/sh

if [ -f /etc/zshenv ] ; then
    sudo mv /etc/zshenv /etc/zprofile
fi
