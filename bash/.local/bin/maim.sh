#!/bin/bash

maim "$@" | xclip -selection clipboard -t image/png
notify-send maim "Image copied"
