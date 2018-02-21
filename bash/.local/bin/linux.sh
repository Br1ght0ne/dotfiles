#!/bin/sh

LINUX_NAME=`lsb_release -ds | tr -d \" | cut -d ' ' -f 1`
echo " $LINUX_NAME"
