import os
import json
import urllib

xkcd_dir = "/home/"+os.environ['USER']+"/.xkcd_download"

if not os.path.exists(xkcd_dir):    # creates folder to store all data
    os.mkdir(xkcd_dir)
    print "creating directory " + xkcd_dir

if not os.path.exists(xkcd_dir+"/previous_comic.txt"):
    previous_comic = open(xkcd_dir+'/previous_comic.txt', 'w+')
    previous_comic.write('NULL')
    print "no previous comic deteced, creating file..."
    previous_comic.close()

url = "http://xkcd.com/info.0.json"  # URL for xkcd json file

xkcdJsonURL = urllib.urlopen(url)   # parses json file
data = json.loads(xkcdJsonURL.read())
previous_comic = open(xkcd_dir+'/previous_comic.txt', 'r')

if previous_comic.read() != data['img']:
    previous_comic.close()
    os.system('wget -P ' + xkcd_dir + ' ' + data['img'])
    previous_comic = open(xkcd_dir+'/previous_comic.txt', 'w')
    previous_comic.write(data['img'])
    previous_comic.close()
else:
    print "Already got the comic!"






