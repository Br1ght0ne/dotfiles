#!/usr/bin/env ruby

require 'bspwm'

my_workspaces = %w(vids webs code stff chat trm1 trm2 trm3 news serv)

my_config = {
  border_width: 2,
  window_gap: 10,
  split_ratio: 0.5,
  borderless_monocle: true,
  gapless_monocle: true,
  initial_polarity: :second_child,
  click_to_focus: :any
}

my_rules = {
  qutebrowser: {
    desktop: 2
  },
  emacs: {
    state: :tiling,
    desktop: 3
  },
  %i(mpv mpsyt) => {
    desktop: 1
  },
  wire: {
    desktop: 5
  },
  dropdown: {
    state: :sticky
  },
  pavucontrol: {
    state: :floating
  }
}

my_commands = [
  '$HOME/.local/bin/bootstrap &',
  'sxhkd -m 1 &',
  '$HOME/.local/bin/layout us &'
]

BSPWM.configure do
  monitor my_workspaces
  config my_config
  rules my_rules
  run my_commands
end
