#!/usr/bin/env zsh

fpath+="$HOME/.zsh/completions"

autoload -Uz compinit
if [ -f ${ZDOTDIR:-$HOME}/.zcompdump ]; then
  compinit -C
else
  compinit
fi

# Custom compdefs
# compdef exa=ls
