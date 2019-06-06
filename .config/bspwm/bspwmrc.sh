#!/bin/bash

scripts="$HOME/.local/bin"

"$scripts/bspwm-monitor.sh"
wmname LG3D
xsetroot -cursor_name left_ptr

# pip3 install --user flashfocus
# bspc config border_width            0
bspc config border_width            2
bspc config window_gap              5
bspc config split_ratio             0.5
bspc config borderless_monocle      true
bspc config gapless_monocle         true
bspc config single_monocle          true
bspc config initial_polarity        second_child
bspc config click_to_focus          any
bspc config pointer_follows_monitor true

bspc desktop 二 -l monocle
bspc desktop 五 -l monocle

bspc config external_rules_command "$scripts/bspwm_external_rules"

"$scripts/bootstrap"
