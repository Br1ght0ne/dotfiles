#!/bin/sh

killall polybar
nohup polybar -r simple &
nohup polybar -r external &
