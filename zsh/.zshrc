ENABLE_CORRECTION="true"
alias pg="ps aux | grep"
alias sig='signal-cli -u +380953477459'
alias sigrec='signal-cli -u +380953477459 receive'

sigsend () {
	signal-cli -u '+380953477459' send -m $2 $1
}

alias sigsd='sigsend "+380953477459"'

alias ec='emacsclient'
alias ecc='emacsclient -c'

# wal -R & 2>/dev/null

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" > /dev/null
PURE_CMD_MAX_EXEC_TIME=15
bindkey "^R" history-incremental-search-backward

export VISUAL=emacsclient
export EDITOR="$VISUAL"
#eval $(thefuck --alias)
#unsetopt correct_all
