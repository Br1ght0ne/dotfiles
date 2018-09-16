#!/bin/sh

ext=$(xrandr | grep 'VGA1 connected')
if [ -n "$ext" ]; then
	echo ext
	bspc monitor LVDS1 -d trm1 webs code
	bspc monitor VGA1 -d vids stff chat trm2 trm3 news serv
	exit 0
fi

echo noext
bspc monitor -d I II III IV V VI VII VIII IX X

