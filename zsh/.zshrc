# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

. "$HOME/.zsh_aliases"

#=== ALIASES & FUNCS ===#

stream() {
	if [ $# -eq 0 ]; then
		q=best
	else
		q=$2
	fi
	streamlink $1 best
}

alias hiber="sudo systemctl hibernate -i"
alias pg="ps aux | grep"
alias v='vim'
alias e='emacsclient -a vim -t'
alias se='sudo emacsclient -a vim -t'
alias ec='emacsclient -c -a vim'
alias sec='sudo emacsclient -c -a vim'

alias git='hub'
compdef hub=git

alias pass='gopass'
#compdef gopass=pass

#compdef trizen=pacman

#alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'

# wal -R & 2>/dev/null

PURE_CMD_MAX_EXEC_TIME=15
bindkey "^R" history-incremental-search-backward

export VISUAL=vim
export EDITOR="$VISUAL"
export GPG_TTY=$(tty)
