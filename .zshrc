# antibody bundle < ~/.zsh/plugins.txt > ~/.zsh/plugins.zsh
source ~/.zsh/plugins.zsh

for f in "$HOME"/.zsh/**/*.zsh; do
	source "$f"
done

[[ $DISPLAY ]] || startx
