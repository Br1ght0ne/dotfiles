#!/bin/bash

SRCDIR=`dirname $0`

if ! type "stow" &> /dev/null; then
	echo "Install GNU Stow first."
else
	find $SRCDIR -maxdepth 1 -not -name '_*' -not -name '.*' -type d -printf "%f\n" | xargs stow -t $HOME
	echo "Done. Happy usage!"
fi
