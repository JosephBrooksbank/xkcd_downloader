#!/bin/python2.7

import json
import os
import urllib

xkcd_dir = "/home/" + os.environ['USER'] + "/.xkcd_download"
if not os.path.exists(xkcd_dir):  # creates folder to store all data
    os.mkdir(xkcd_dir)
    print "creating directory " + xkcd_dir
    os.mkdir(xkcd_dir + "/old_comics")
    print "creating directory " + xkcd_dir + "/old_comics"
if not os.path.exists(xkcd_dir + "/previous_comic.txt"):
    previous_comic = open(xkcd_dir + '/previous_comic.txt', 'w+')
    previous_comic.write('NULL')
    print "no previous comic detected, creating file..."
    previous_comic.close()

url = "http://xkcd.com/info.0.json"  # URL for xkcd json file
xkcdJsonURL = urllib.urlopen(url)  # parses json file
data = json.loads(xkcdJsonURL.read())
safe_title = data['title'].replace(' ', '_').lower() + ".png"
previous_comic = open(xkcd_dir + '/previous_comic.txt', 'r')
previous_comic_title = previous_comic.read()
previous_comic.close()

current_xkcd_comic = xkcd_dir + "/" + safe_title
if previous_comic_title != safe_title:  # downloads comic if new

    if not previous_comic_title == "NULL":  # Checks for first-run
        os.system("mv " + current_xkcd_comic + ' ' + xkcd_dir + "/old_comics")

    os.system('wget -P ' + xkcd_dir + ' ' + data['img'])
    previous_comic = open(xkcd_dir + '/previous_comic.txt', 'w')
    previous_comic.write(safe_title)
    previous_comic.close()
    
    (os.system("convert " + current_xkcd_comic + " -background White -font Lucida-G -pointsize 10 label:'" + data["alt"]
               + "' -gravity Center -append " + current_xkcd_comic))
else:
    print "Already got the comic!"
