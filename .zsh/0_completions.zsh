#!/usr/bin/env zsh

fpath=("$HOME/.zsh/completions" "$(rustc --print sysroot)/share/zsh/site-functions" /home/linuxbrew/.linuxbrew/share/zsh/site-functions $fpath)

autoload -U compinit; compinit
compinit -C

for completion in "$HOME"/.zsh/completions/*.zsh; do
	source "$completion"
done

compdef exa=ls

autoload -U bashcompinit; bashcompinit
source "$HOME/.asdf/completions/asdf.bash"