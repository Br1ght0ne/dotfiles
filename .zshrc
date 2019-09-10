zdir=$HOME/.zsh

setopt auto_cd

. $zdir/env.zsh

[[ -f $zdir/plugins.zsh ]] || \
	antibody bundle < $zdir/plugins.txt > $zdir/plugins.zsh
. $zdir/plugins{,-config}.zsh
bin
. $zdir/completions.zsh

. $zdir/aliases.zsh
. $zdir/bindings.zsh

. $zdir/theme.zsh

. $zdir/hooks.zsh

# (linux && term) -> X
if command -v startx &>/dev/null; then
	[[ $DISPLAY ]] || startx
fi
