#=== PREZTO ===#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#=== ALIASES & FUNCS ===#

. "$HOME/.zsh_aliases"

#=== BINDINGS ===#

bindkey "^R" history-incremental-search-backward

#=== COMPLETIONS ===#

autoload -U compinit && compinit
source <(doctl completion zsh)
