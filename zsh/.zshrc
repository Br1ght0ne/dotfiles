# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias pg="ps aux | grep"
alias v='vim'
alias e='emacsclient -a vim'

#alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'

# wal -R & 2>/dev/null

PURE_CMD_MAX_EXEC_TIME=15
bindkey "^R" history-incremental-search-backward

export VISUAL=vim
export EDITOR="$VISUAL"
export GPG_TTY=$(tty)
