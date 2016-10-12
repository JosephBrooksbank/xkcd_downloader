#!/bin/bash 

osType=$(uname -s)

if [ "$(whoami)" != "root" ]; then
	echo "Sorry, you are not root."
		exit 1
	fi

if type convert 2>/dev/null; then
	case "$osType" in 
		"Darwin")
		{
			echo "Installing mac version..."
			cp $PWD/xkcd_download-mac /usr/bin/xkcd_download
			cp $PWD/xkcd_download.1.gz /usr/share/man/man1
			echo "Successfully installed, images located in ~/.xkcd_download (run xkcd_download to intialize)"
		} ;;
		"Linux")
		{
			echo "Installing LINUX  version..."
			cp  $PWD/xkcd_download /usr/bin/xkcd_download 
			cp $PWD/xkcd_download.1.gz /usr/share/man/man1
			echo "Sucessfully installed, images located in ~/.xkcd_download (run xkcd_download to initialize)"
			exit 0
		} ;;
		*)
		{
			echo "Unknown OS, exiting"
			exit 1
		} ;;
	esac
else
	echo "ImageMagick not installed, exiting..."
	exit 1
fi
