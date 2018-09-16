#!/bin/bash

scripts="$HOME/.local/bin"

"$scripts/bspwm-monitor.sh"
wmname LG3D

bspc config border_width           3
bspc config window_gap             5
bspc config split_ratio            0.5
bspc config borderless_monocle     true
bspc config gapless_monocle        true
bspc config single_monocle         true
bspc config initial_polarity       second_child
bspc config click_to_focus         any

bspc config external_rules_command "$scripts/bspwm_external_rules"
# bspc rule -a mpv-cam                            state=floating,sticky
# bspc rule -a mpv                                state=fullscreen
# bspc rule -a qutebrowser        desktop='II'    follow=off
# bspc rule -a Emacs              desktop='I'     state=tiled follow=off
# bspc rule -a libreoffice                        state=tiled
# bspc rule -a Wire               desktop='V'     follow=off
# bspc rule -a Riot               desktop='V'     follow=off
# bspc rule -a dropdown                           state=sticky
# bspc rule -a Pavucontrol                        state=floating
# bspc rule -a st-floating                        state=floating
# bspc rule -a Pinentry                           state=floating
# bspc rule -a Transmission-gtk   desktop='X'     follow=off
# bspc rule -a Screenkey manage=off
# bspc rule -a Zathura                            state=tiled
# bspc rule -a libreoffice-writer                 state=tiled

"$scripts/bootstrap"
