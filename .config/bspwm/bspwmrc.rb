#!/usr/bin/env ruby

require 'bspwm'

BSPWM.configure do
  monitor %w(vids webs code stff chat trm1 trm2 trm3 news serv)

  config {
    border_width: 2,
    window_gap: 10,
    split_ratio: 0.5,
    borderless_monocle: true,
    gapless_monocle: true,
    initial_polarity: :second_child,
    click_to_focus: :any
  }

  rules {
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

  run [
    '$HOME/.local/bin/bootstrap &',
    'sxhkd -m 1 &',
    '$HOME/.local/bin/layout us &'
  ]
end
