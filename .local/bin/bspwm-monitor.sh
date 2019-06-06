#!/bin/sh

ext=$(xrandr | grep 'VGA1 connected')
if [ -n "$ext" ]; then
	echo ext
	bspc monitor LVDS1 -d 一
	bspc monitor VGA1 -d 二 三 四 五 六 七 八 九 十
	exit 0
fi

echo noext
# bspc monitor -d I II III IV V VI VII VIII IX X
bspc monitor -d 一 二 三 四 五 六 七 八 九 十
