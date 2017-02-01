#!/bin/bash 

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
cp  $PWD/xkcd_download /usr/bin/xkcd_download
sudo cp $PWD/xkcd_download.1.gz /usr/share/man/man1

if [ ! -d "$HOME/.config/xkcd_download" ]; then
    mkdir $HOME/.config/xkcd_download
    cp $PWD/xkcd_download.conf $HOME/.config/xkcd_download
fi
