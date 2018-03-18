#=== PREZTO ===#

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#=== ALIASES & FUNCS ===#

. "$HOME/.zsh_aliases"

#=== BINDINGS ===#

bindkey "^R" history-incremental-search-backward

#=== COMPLETIONS ===#

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/.zsh/cache"

fpath=(~/.zsh/completion $fpath)
autoload -U compinit && compinit
source <(doctl completion zsh)
