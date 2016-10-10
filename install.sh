#!/bin/bash 

if [ "$(whoami)" != "root" ]; then
		echo "Sorry, you are not root."
			exit 1
		fi
cp  $PWD/xkcd_download /usr/bin/xkcd_download 
echo "Sucessfully installed, images located in ~/.xkcd_download (run xkcd_download to initialize)"
