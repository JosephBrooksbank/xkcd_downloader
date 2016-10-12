#!/bin/bash 


if [ "$(whoami)" != "root" ]; then
	echo "Sorry, you are not root."
		exit 1
	fi

	if ! (which convert > /dev/null); then 
	echo "ImageMagick not installed, attepting to install..."
	if [[ "$OSTYPE" == 'linux-gnu' ]]; then
		echo "Too many options for Linux installs, please install ImageMagick yourself" 
			exit 1
		fi
	if [[ $OSTYPE == darwin* ]]; then 
		echo "Using Mac OSX, continuing using HomeBrew..."
		if ! (which brew > /dev/null); then 
			echo "please install homebrew to continue"
			echo "if you use MacPorts, please install ImageMagick manually"
			exit 1 
		fi 
		sudo brew install ImageMagick
		if ! (which convert > /dev/null); then
			echo "install failed, try to install ImageMagick manually"
			exit 1
		fi
	fi 
fi

cp  $PWD/xkcd_download /usr/bin/xkcd_download 
cp $PWD/xkcd_download.1.gz /usr/share/man/man1
echo "Sucessfully installed, images located in ~/.xkcd_download (run xkcd_download to initialize)"

