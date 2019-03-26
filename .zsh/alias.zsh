#!/usr/bin/env zsh

org2pdf() {
    out=`basename $1 .org`
    pandoc -s "$1" -o "${out}.pdf" --pdf-engine=xelatex -V mainfont="Open Sans" -V geometry:margin=1in
}

weechat() {
    env WEECHAT_PASSPHRASE=$(pass show im/local/weechat) weechat
}

lyrics() {
    clear
    beet lyrics -p "$@" | more
}

screc() {
    ffmpeg -video_size 1366x768 -f x11grab -i :0.0 ~/screen.gif &!
}

steamlib32() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu:. $@
}

steamlib32clean() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu $@
}

steamlib64() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/lib/x86-64-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/usr/lib/x86-64-linux-gnu:. $@
}

steamlib64clean() {
    LD_LIBRARY_PATH=/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/lib/x86-64-linux-gnu:/home/brightone/.local/share/Steam/ubuntu12_64/steam-runtime/amd64/usr/lib/x86-64-linux-gnu $@
}

writeiso() {
    sudo dd if="$1" of="$2" status=progress bs=4M oflag=sync
}

mountiso() {
    sudo mount -o loop "$1" /mnt/iso
}

decrypt() {
    $1 <(gpg2 --decrypt $2)
}

dotnet-boot() {
    mkdir $1
    cd $1
    dotnet new sln
    dotnet new $2
    dotnet sln add $1.csproj
}

ranger-cd() {
    [[ -z "$RANGER_LEVEL" ]] || exit

    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

rename-screen() {
    fname="$1"
    mv ~/screen.png ~/pics/screenshots/"${fname}".png
}

fcopy() {
    cat $1 | xclip -selection clipboard
}

wine64() {
    WINEARCH=win64 WINEPREFIX=~/.wine64 wine $@
}

pg() {
    ps aux | grep "[${1:0:1}]${1:1}"
}

serveo() {
    ssh -R 80:localhost:${1:-3000} serveo.net
}

# Gentoo stuff
alias gfu='sudo emerge -uND --with-bdeps=y @world && sudo emerge -c && sudo revdep-rebuild'
alias sync-gfu='sudo eix-sync && gfu'
alias ask-gfu='sudo emerge -auND --with-bdeps=y @world && sudo emerge -c && sudo revdep-rebuild'
alias ask-sync-gfu="sudo eix-sync && ask-gfu"
alias rebuild-kernel="cd /usr/src/linux && sudo make oldconfig && sudo make -j6 && sudo make -j6 modules_install && sudo make -j6 install && sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo emerge -v @module-rebuild && cd -"

alias cp='cp --reflink=auto'
alias doom='~/.emacs.d.doom/bin/doom'
alias e='$EDITOR'
alias em='emacsclient -a vim -t'
alias emc='emacsclient -c -a vim'
alias tddg="BROWSER=links ddgr"
alias f='ranger-cd'
alias hiber='sudo zzz || sudo systemctl hibernate -i'
alias ls='exa'
alias l='ls -1a'
alias lyrics='music lyrics'
alias m='ncmpcpp'
alias mpm='mpv --no-video'
alias n='nnn'
alias news='newsboat'
alias rf='rifle'
alias rss='canto-curses'
alias rtv='RTV_URLVIEWER="urlscan -d -r \"urlopen {}\"" rtv --enable-media'
alias q='qutebrowser'
alias se='sudo emacsclient -a vim -t'
alias sec='sudo emacsclient -c -a vim'
alias ts='trans -t'
alias unmerge='sudo emerge --unmerge'
alias v='$VISUAL'
alias z='zathura'
alias X='startx'

# Ruby
alias rac='bundle exec rails console'
alias bu='bundle'
alias bue='bundle exec'
alias bus='bundle exec rspec'
