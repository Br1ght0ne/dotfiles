export HOMEBREW_AUTO_UPDATE_SECS=86400 # don't update more often than every day
export HOMEBREW_EDITOR="vim"
export HOMEBREW_GITHUB_API_TOKEN=$(pass show tokens/github/homebrew)
export MANPATH="/home/linuxbrew/.linuxbrew/Homebrew/manpages:$MANPATH"
