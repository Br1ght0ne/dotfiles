ENABLE_CORRECTION="true"
alias vim="nvim"
alias pg="ps aux | grep"

# (wal -r -t &)

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" > /dev/null
PURE_CMD_MAX_EXEC_TIME=15
bindkey "^R" history-incremental-search-backward
#eval $(thefuck --alias)
#unsetopt correct_all
