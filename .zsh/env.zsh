#!/usr/bin/env zsh

# PATH
export PATH="$HOME/.local/bin:$HOME/.emacs.d/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH"

# Firefox
export BROWSER="firefox"

# Docker
export COMPOSE_HTTP_TIMEOUT=120

# Ledger
export LEDGER_FILE=$HOME/org/accounting/main.ledger

# Gentoo
export ECHANGELOG_USER="Oleksii Filonenko <brightone@protonmail.com>"

# Podcast directory for `podcast` - a command-line podcast manager.
# https://crates.io/crates/podcast
export PODCAST="$HOME/podcasts"

# Ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Ansible
export ANSIBLE_NOCOWS=1

# Brew
export HOMEBREW_AUTO_UPDATE_SECS=86400 # don't update more often than every day
export HOMEBREW_EDITOR="vim"
