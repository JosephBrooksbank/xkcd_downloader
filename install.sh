#!/bin/bash 

#if [ "$(whoami)" != "root" ]; then
#	echo "Sorry, you are not root."
#		exit 1
#	fi
cp  $PWD/xkcd_download /usr/bin/xkcd_download
sudo cp $PWD/xkcd_download.1.gz /usr/share/man/man1
mkdir $HOME/.config/xkcd_download
cp $PWD/xkcd_download.conf $HOME/.config/xkcd_download
