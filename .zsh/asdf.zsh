. "$HOME/.asdf/asdf.sh"

# Add Go to PATH
for version in ~/.asdf/installs/golang/*; do
    export PATH="$PATH:$version/packages/bin"
done
