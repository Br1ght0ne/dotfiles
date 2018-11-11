### Added by Zplugin's installer
source '/home/brightone/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

#=== PLUGINS ===#

# Prezto
zplugin ice svn lucid zplugin snippet PZT::modules/git
zplugin ice svn lucid zplugin snippet PZT::modules/completion
zplugin ice svn; zplugin snippet PZT::modules/history
zplugin ice svn; zplugin snippet PZT::modules/directory
zplugin ice svn; zplugin snippet PZT::modules/utility

zplugin ice svn lucid atload'prompt steeef'
zplugin snippet PZT::modules/prompt

## Prezto/Tmux
zstyle ':prezto:module:tmux:auto-start' local 'no'
zstyle ':prezto:module:tmux:auto-start' remote 'yes'
zstyle ':prezto:module:tmux:session' name 'ssh'
zplugin ice svn lucid; zplugin snippet PZT::modules/tmux
zplugin ice lucid pick'manydots-magic' atload'autoload -Uz manydots-magic; manydots-magic'; zplugin load knu/zsh-manydots-magic
zplugin light zdharma/history-search-multi-word
zplugin ice lucid; zplugin load zdharma/fast-syntax-highlighting
# zplugin ice lucid wait'3'; zplugin load zdharma/zui
# zplugin ice lucid wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'; zplugin load zdharma/zplugin-crasis
zplugin ice silent atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down"; zplugin load zsh-users/zsh-history-substring-search

#=== ALIASES & FUNCS ===#

. "$HOME/.zsh_aliases"

#=== BINDINGS ===#

# bindkey "^R" history-incremental-search-backward
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

#=== COMPLETIONS ===#

autoload -Uz compinit
compinit
compdef exa=ls

#=== LOOKS ===#

(\cat ~/.cache/wal/sequences &)
