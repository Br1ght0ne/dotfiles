#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='emacsclient -a vim -c'
export VISUAL='emacsclient -a vim -c'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /{usr/,}sbin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

export PATH="$HOME/.local/share/junest/bin:$HOME/.dotnet:$HOME/.rbenv/shims:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:$HOME/.yarn/bin:$HOME/go/bin:/usr/lib/llvm/7/bin:/usr/lib/llvm/5/bin"

# ccache
export PATH="/usr/lib/ccache/bin:$PATH"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export PATH="$HOME/.flutter-sdk/flutter/bin:$PATH"
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"

# Homebrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
