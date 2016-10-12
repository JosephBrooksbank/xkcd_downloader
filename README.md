# xkcd_downloader
Simple script to download the latest xkcd 

#####Dependencies: 
`ImageMagick` 

`python2.7`

###To install:
`sudo ./install.sh`

###To uninstall: 
`./remove.sh`

##Usage:
simply run `xkcd_download` to save the latest comic in `~/.xkcd_download`. If you use a wallpaper manager like `feh`, you can keep your wallpaper as the newest comic with `feh -bg-center /home/your_name/.xkcd_download/*.png --image-bg white`

###Arguments: 
`-v, --verbose`     Makes the output more verbose, useful if the comic isn't downloading properly


`-r, --remove`      Removes the previous comic rather than storing it in old_comics


