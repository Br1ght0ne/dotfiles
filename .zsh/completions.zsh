#!/usr/bin/env zsh

fpath+="$HOME/.zsh/completions"

autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Custom compdefs
# compdef exa=ls
