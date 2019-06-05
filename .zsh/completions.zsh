#!/usr/bin/env zsh

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump* ]]; then
	compinit
else
	compinit -C
fi

fpath=("$HOME/.zsh/completions" $fpath)

compdef exa=ls
