source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

for f in "$HOME"/.zsh/*.zsh; do
    source "$f"
done

[[ $DISPLAY ]] || startx
