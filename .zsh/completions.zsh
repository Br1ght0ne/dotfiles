#!/usr/bin/env zsh

fpath=("$HOME/.zsh/completions" $fpath)

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump* ]]; then
	compinit
else
	compinit -C
fi

. "$HOME/.asdf/completions/asdf.bash"

compdef exa=ls
