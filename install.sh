#!/bin/bash

if ! type "stow" &> /dev/null; then
  echo "Install GNU Stow first."
else
  if [[ $PWD = "$HOME/dotfiles ]]; then
    stow cava dunst i3 neofetch polybar ranger rofi termite vis zsh
    echo "Done. Happy usage!"
  else
    echo "You should clone this repo to ~/dotfiles for stow to work correctly. Sorry :("
  fi
fi